Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B74EE499C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 19:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4AF10E783;
	Wed, 11 Sep 2024 19:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCKJl1wg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281A910E199
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 19:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726081984; x=1757617984;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KCjYWGPHnJ5JW5ASxxYEuRK3g7n0/lZvP6zhESzpc+Y=;
 b=PCKJl1wgWH/INqgMO8I3tbVqKaqKh4MNvxGuqgalKwq7TTod+MTlMnJN
 kRIsEXphaahD/oGcAipucP7ojzwp7Vsb3UCBiEekyHvliYt7PMFv3UNtu
 Acq4lhkv2o1+WjUgLUzMBHLFiITaUUFSBsVtxFLNABDdKM3X4EA/zCQlx
 14aIjUDXOtNW1rNeQ9fqcing4tqW5/uKCXonsCFkWHWP+eMGRuUd0Jgp3
 FVkFnsGzJ4Qcqilf2eOLVRKSQtuyVqFGsvsoD/ekAAKt8S2k3QYEH4C6s
 JfZkyQ3Uk1tNWrr+rUZzPJ/T5aNPqxsWxw4LnPH7JQx1jvFpMaAUekVF5 A==;
X-CSE-ConnectionGUID: Qv5yE1bVSHGybXyMu+JIbg==
X-CSE-MsgGUID: q09LujC+R/ax3LwEXP1z/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35473815"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="35473815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 12:13:04 -0700
X-CSE-ConnectionGUID: Gq5isM/2RhC86rvyNYhTbw==
X-CSE-MsgGUID: 2mQ6V8qFRBOUmZI87wsfVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="71586477"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 12:13:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:13:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 12:13:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 12:13:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 12:13:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTCNE594l39tHUbj0ykiYYP0gnv57h1KZU1ioEQV5ZCZtlR6OETLlLF0G+1SQrs2BfrR7i6vIHiarEonRpKLFgmKsscU/l4sLt+pbZ683xzQa5OtJnAXYWUK1o2cFeCCqWvvTW0ZsbpUyjdKZKrtVe/MkvUEhKorb23TtVMlBGxE1gky08ph/WJ2SqnlqzVt7rTVqGv4yNpvrpYmvNGMKxYu7enc1Ok8t1qhLhyhtqmJDSNCdgj5McSnUEJ0g2eeLos3lngU9YuWVZcJwDr0hU6Xt74TxXfoB6BQjNYFngXKUIgPPdAKRh5LwKbtnbyRZEIniOO2gUhcBumrPKpqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM+R70NyTX75U8as2VNMYgwuzT0h8LSQ9EfOB7Drcl8=;
 b=yiRJaMrO9nuA8ehe117OhvIQLsSmpMVZPwgr5qSecuThO0JyMyDVcq/M/SSBxazOK7568Ajkk62KzRVNgpdWVCHqE1bHR62692hVKMrRA18n+4Rrkg1nMg7ScV2dBOjpahSDMeaod8NTuJEZcFeHlIJfoJb3ghGLXpShgR+Sdm+LHmAZ0OubOz8Lv29IsYDSQpNA5vT54rvNiK6/J2fuqMhoj5XKfprgGE+Bxy7DdT1aNf9oQ4lVYvpIrU6PX9eNOZg8LidleLjgIgsA+rvZktz4rGz05aUmz2H63340OdFJTmwUoI6cbEYX1h9Z1nO/xknZYVpnVFPaGfV1DHYyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5138.namprd11.prod.outlook.com (2603:10b6:303:94::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 19:13:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 19:13:00 +0000
Date: Wed, 11 Sep 2024 14:12:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
 <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
 <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
 <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
X-ClientProxiedBy: MW4PR04CA0371.namprd04.prod.outlook.com
 (2603:10b6:303:81::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5138:EE_
X-MS-Office365-Filtering-Correlation-Id: fc46cfbb-4066-4b3b-aae6-08dcd295c077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fJuCIXq3/2nxcY0/n2DSt7EQT/mD1Tm7a4DYRduffsHyvm+ztVS+R68VNP?=
 =?iso-8859-1?Q?laKGu6NYyZpIkoTXJWxN7sNIL25cqXHd3B6nJbUoI5cDLmvLfr58H8p5gL?=
 =?iso-8859-1?Q?4gsGCRX0dK9zXnbU7o+Gx2UpemieAyUE7+6apum8nJ0stN375Eb6l9wNjE?=
 =?iso-8859-1?Q?kgEEoxpCXYPSEeCsgWoOh2XzY1UOS+f2W9a5ezFhzvesjT9MT7HZ1+cXJR?=
 =?iso-8859-1?Q?dQOsioBjChB+KpX+4bj2dqKR2eoP8fC08dURo+U2hdiuKZPeDDKZwm/vYt?=
 =?iso-8859-1?Q?B91aTyp49peU7rXqTZPv/1ObkDfSaEqBqxAkm4O8V9c4Y0E5U7WtDQq/kL?=
 =?iso-8859-1?Q?o6309R7Hz7IrRXJ8ty84GPSGZyX6fyPodH+Bk0TY7YuJZmb895VFiZvYD+?=
 =?iso-8859-1?Q?fZyFHP24nFgy4pJQboPV3vGFiUmONT5fDS8zZ6Vp9W2TGW2pwqK2MWaOrW?=
 =?iso-8859-1?Q?OTzlCxMJYWpF3FTr3LMo7zYEZjBR5+Mo3RqyJxT6oCTJ+OhUJfCUqf1ly1?=
 =?iso-8859-1?Q?SgC7YGBsDogiTEoDvtsNpJdLFnTfr8LiMisbo9vu7MLuGHAIuFHi+hv2m7?=
 =?iso-8859-1?Q?ReDmOq96XaQTRhsF5zJpwpkL7sQd60HHSWSt7WNMHpPPZnBuxAuq+6/MnO?=
 =?iso-8859-1?Q?q+lq2YSQeLOXulG4+mqeERTPp4hoLl3YyH1gHBVY4qr/HTVvkwDis2uRaS?=
 =?iso-8859-1?Q?po0yIcFF80HZfAiq6YxweKWaz2JbRRVM1u0GXXMAtcngEyQi3FNq/TKKvB?=
 =?iso-8859-1?Q?Gjpnj8LqjxWBWVQEzb8B6PexpCWwLioEdr6SAlG2yiPUiABmBYC94fuhLv?=
 =?iso-8859-1?Q?SO3HAOKURnoqflu6MAK65t5Tg+QJZr7HoJMxpEwh1AFnLuvRN0O6QYd+Zd?=
 =?iso-8859-1?Q?AlDZyYsct55lb9Xw1Sdckg096NMUIjVWwMObEcpjy/xWwxi1LEUMfPpU+z?=
 =?iso-8859-1?Q?J7OS+wC9pyJvQo8r/wUtRYESkB/gYjX9pbsvBH+Z7mtO7tBvxO+g70Mk2z?=
 =?iso-8859-1?Q?0SiWJHy/YKTBT9l4rkYePZFGeUqLnnD1yuqrtFThw3OZGx0YInUzHMAKDE?=
 =?iso-8859-1?Q?JvYuccMfBSr6amXm4h68eQf4x1fP5bfhETpu9LhhnAIiDkNpGSG1y6N/HI?=
 =?iso-8859-1?Q?8kDidDFmiZOvbjD4YIIjTXUz/p854OYkKj9jXhFKSf08MwvTjsDqLRtuVm?=
 =?iso-8859-1?Q?X5KjvRREyam1Y09AfJZKJi8sZSkOvLFEqakhVT/YDBfIMssQpN32EwFDGb?=
 =?iso-8859-1?Q?WmT458fMshMYECwA/PxdbDunY2U7/RsQaqW3O2Gx+JNAGpsF1xZKkfsMl8?=
 =?iso-8859-1?Q?Hhn5nCS5VWUAxrdpx/MIF+iurP0YtxX9g8YbEasS5W9vRnYsdzGdG46BUr?=
 =?iso-8859-1?Q?knRZvaxvZ+f5TaTkaQ9rzfAkGrPDMQsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?goYtWdi++HGiFN/HUg8OzNGL04cQkM5Uw3RTDsuCd+wwh289N9DZ6txACO?=
 =?iso-8859-1?Q?MewmPJJ/CZt4QzYBkejcEepXPNQ5zsI9PewGzFI5nnsAWiQLXM8IWpUo7a?=
 =?iso-8859-1?Q?u0XyD9JCZgiujud8XoDLuWCWqgBb2TuhypSEidEqgBd+C79tjjYluYqaQp?=
 =?iso-8859-1?Q?gWZY88bL6CgoybCJPV8G42c/1Mru18w+vPuMm5z8XH7hvA0iYl7gRCp6jF?=
 =?iso-8859-1?Q?+lVMiE/ahNwDtg0g479h3LjUVQNHwUHpNK5BuI9EtX9sL0ScdD8oBuC3Bt?=
 =?iso-8859-1?Q?gmkuKFglqD2JhbeTlouUapuqf/Zm23PNA7oSZpt3ll+T80MJ1LVAbHU+M5?=
 =?iso-8859-1?Q?xGAq/xziJaG8tuK0SIewPoY7H4hd2KXdn4QKNaq3nlYPU7d+0pOYtffEbW?=
 =?iso-8859-1?Q?M8Giei58Rrl5AYRTuScJzwqUIoQbyhTT7V5mb+G4o0VQFyMLl6daB0FPCC?=
 =?iso-8859-1?Q?H3WoaCivosaaAiANrZonwGgyk6IF1UOLneE81YMfsojrW7cXA2P+6Ww5xi?=
 =?iso-8859-1?Q?qaeEWC7dxIWRoG1rgwOf7aI+MLzqlcjKdJDwY7HwaNgaSt2kQ5e+tnZWT4?=
 =?iso-8859-1?Q?cmgSYdQJU4ByzzGjpW7gnaAmPvq5dppMyXsGgeKliiTrO7no867s2N+Tuo?=
 =?iso-8859-1?Q?MCmeNlO4VRIs3Oi1u1J5WV1aLsO4uCIDg5ruf8tEiI34chbmBfJv5IR7aL?=
 =?iso-8859-1?Q?4bnSog1NWgnN1KpXfZYYzmdNYC2DsxK4seCf11sGOI7lnJwvFWWbqSpkDs?=
 =?iso-8859-1?Q?rKR3wNk0653OL+Rcp8BGM34kMvvWZOJblM847IDE4u5yUJt6FQc1sBsrYv?=
 =?iso-8859-1?Q?efWP12XQmEYC6HhiQ/SMB8NybxOSSgOEaoBUhoeVW4BgWwJrY6F/ol8OWL?=
 =?iso-8859-1?Q?uNwVIvWa5o6wZ4W7UXZLNYjklPM8yAQKJ8cDdYpxKZEOnGo1YWYK5GSvxL?=
 =?iso-8859-1?Q?1AeqHY0bBgnPqLb/lf3fFQ0eFj4jlPd0KrNz6TI9MBXHpoIhIn+nTj7qY5?=
 =?iso-8859-1?Q?ZvxcnIiRPs5l6U+TuAvLRosKlNlh2Ocd+4zxzM/DvTEcJ7eHsoXtwp1S1J?=
 =?iso-8859-1?Q?/SPhPrJiGo3Z8fIf8VT17xcvMqxG1c/TIBBc8IAP/DxHeNh9sGBuH1Y/X9?=
 =?iso-8859-1?Q?zE/rfJfRfBfIThs7ImA+/rx81mnRr+eMDKvxRqnRi1fpc+SgehWYxL6rQQ?=
 =?iso-8859-1?Q?Be0Cu/MpmmX28v6DvvA3+4jH6tv8O3YFKDp49htn58yBxO3h6z+pFjT0ry?=
 =?iso-8859-1?Q?+OkkgDq8ztGiQaS516mtUVDNXYvzbXTzxz458Tb16lTN5+m1iX/3nXnqpB?=
 =?iso-8859-1?Q?s39VF3T5UnQ2fG2bKL29eYqqBjzBvrz21N/8iMHwIJV3rOQ6fPyq9dAREL?=
 =?iso-8859-1?Q?o3Xoxl2f50TOGcoBIgt1YBfMwkvvoWN65G9lR9F0SYe4fKhNvlh0xXhnUx?=
 =?iso-8859-1?Q?vktjUYXaN3W1h/NknHjl+BuXS7wpLOLx2BDto9EkzNVDLR1gpCvrh4Tycj?=
 =?iso-8859-1?Q?yp6zjGgWpai5RZnbQEqlGYuNcN8++UcEVFJHpNvEbyL5+X/kZ/0mfni72a?=
 =?iso-8859-1?Q?m/Ni3GptfZabWDkvxEmEJox3GQvJBBnfsCzwpb5F0X4NdOj9tcUD4vl1l4?=
 =?iso-8859-1?Q?N397Hwm87eYvKhtzFL5t3kIAh9pnNZecnRTZQaBrlfHpFFamXvYr0KKw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc46cfbb-4066-4b3b-aae6-08dcd295c077
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:13:00.3732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNg5e+NzoZPRj1DoPrP6Q+zWfhBjDLPP7fKXaUu+vtJIb5GYZR3poS5StbiPxYqNycrdUQ0HB1gzvprzxuShQBHVR1/mmYvi53usmTsAIqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5138
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

On Tue, Sep 10, 2024 at 01:17:11PM GMT, John Harrison wrote:
>On 9/10/2024 12:43, Lucas De Marchi wrote:
>>On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
>>>On 9/6/2024 19:06, John Harrison wrote:
>>>>On 9/5/2024 20:04, Lucas De Marchi wrote:
>>>>>On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>>>>>On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>>>>>On Thu, Sep 05, 2024 at 01:50:58PM GMT, 
>>>>>>>John.C.Harrison@Intel.com wrote:
>>>>>>>>From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>
>>>>>>>>There is a need to include the GuC log and other large 
>>>>>>>>binary objects
>>>>>>>>in core dumps and via dmesg. So add a helper for dumping 
>>>>>>>>to a printer
>>>>>>>>function via conversion to ASCII85 encoding.
>>>>>>>
>>>>>>>why are we not dumping the binary data directly to devcoredump?
>>>>>>As per earlier comments, there is a WiFi driver or some such 
>>>>>>that does exactly that. But all they are dumping is a binary 
>>>>>>blob.
>>>>>
>>>>>In your v5 I see you mentioned
>>>>>drivers/net/wireless/ath/ath10k/coredump.c, but that is a 
>>>>>precedence for
>>>>>including it as is from the device rather converting it to ASCII85 or
>>>>>something else. It seems odd to do that type of conversion in kernel
>>>>>space when it could be perfectly done in userspace.
>>>>It really can't. An end user could maybe be expected to zip or 
>>>>tar a coredump file before attaching it to a bug report but they 
>>>>are certainly not going to try to ASCII85 encode random bits of 
>>>>it. Whereas, putting that in the kernel means it is just there. 
>>>>It is done. And it is pretty trivial - just call a helper 
>>>>function and it does everything for you. Also, I very much doubt 
>>>>you can spew raw binary data via dmesg. Even if the kernel would 
>>>>print it for you (which I doubt), the user tools like syslogd 
>>>>and dmesg itself are going to filter it to make it ASCII safe.
>>>>
>>>>The i915 error dumps have been ASCII85 encoded using the 
>>>>kernel's ASCII85 encoding helper function since forever. This 
>>>>patch is just a wrapper around the kernel's existing 
>>>>implementation in order to make it more compatible with printing 
>>>>to dmesg. This is not creating a new precedent. It already 
>>>>exists.
>>>>
>>>>>
>>>>>$ git grep ascii85.h
>>>>>drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>>>>>drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
>>>>>drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>>>>>drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>>>>>drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
>>>>And the list of drivers which dump raw binary data in a coredump 
>>>>file is... ath10k. ASCII85 wins 3 to 1.
>>>>
>>>>
>>>>>
>>>>>>
>>>>>>We want the devcoredump file to still be human readable. 
>>>>>>That won't be the case if you stuff binary data in the 
>>>>>>middle of it. Most obvious problem - the zeros in the data 
>>>>>>will terminate your text file at that point. Potentially 
>>>>>>bigger problem for end users - random fake ANSI codes will 
>>>>>>destroy your terminal window if you try to cat the file to 
>>>>>>read it.
>>>>>
>>>>>Users don't get a coredump and cat it to the terminal.
>>>>>=(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8
>>>>>
>>>>>
>>>>>
>>>>>Lucas De Marchi
>>>>They might. Either intentionally or accidentally. I've certainly 
>>>>done it myself. And people will certainly want to look at it in 
>>>>any random choice of text editor, pager, etc. 'cos you know, it 
>>>>is meant to be read by humans. If it is full of binary data then 
>>>>that becomes even more difficult than simply being full of ASCII 
>>>>gibberish. No matter what you are doing, the ASCII version is 
>>>>safer and easier to look at the rest of the file around it.
>>>>
>>>>I don't understand why you are so desperate to have raw binary 
>>>>data in the middle of a text file. The disadvantages are 
>>>>multiple but the only advantage is a slightly smaller file. And 
>>>>the true route to smaller files is to add compression like we 
>>>>have in i915.
>>>>
>>>>John.
>>>>
>>>PS: Also meant to add that one of the important uses cases for 
>>>dumping logs to dmesg is for the really hard to repro bugs that 
>>>show up in CI extremely rarely. We get the driver to dump an error 
>>>capture to dmesg and pull that out from the CI logs. Even if you 
>>>could get binary data through dmesg, pretty sure the CI tools 
>>>would also not be happy with it. Anything non-printable will get 
>>>munged for sure when turning it into a web page.
>>
>>I think that's the main source of confusion on what we are discussing.
>>I was not talking about dmesg at all. I'm only complaining about feeding
>>ascii85-encoded data into a *devcoredump* when apparently there isn't a
>>good reason to do so. I'd rather copy the binary data to the
>>devcoredump.
>But the intent is to dump a devcoredump to dmesg. It makes much sense 

It seems like an awful idea to dump hundreds of MB to dmesg.  When we
talked about printing to dmesg it was about **GuC log** and on very
initial states of driver probe where we didn't actually have a good
interface for that. And the log wouldn't be so big. If we can already
capture the devcoredump, what would be the reason to dump to dmesg
(other than the non-valid "our CI captures dmesg, and doesn't
capture devcoredump", which should be fixed).

If any sysadmin have their serial console flooded by such garbage there
are 2 reactions: 1) someone got in control of my machine; 2) something
went really bad with this machine. It's not "fear not, wait for it to
complete, it's just normal debug data I will attach to an issue in
gitlab".  And I'm mentioning a serial console here due to that
cond_resched() added, which is only needed because you are trying to do
in kernel space what should be in userspace.

Oh well... looking at this the main reason to use ascii85 I can see is
because we already have parts of *our* devcoredump using it, and
userspace relying on that. That's new to me. Let's stop bringing dmesg
into this discussion.

>to have a single implementation that can be used for multiple 
>purposes. Otherwise you are duplicating a lot of code unnecessarily.
>
>And I still think it is a *very* bad idea to be including binary data 
>in a text file. The devcoredump is supposed to be human readable. It 

no, it's not. devcoredump doesn't dictate the format, it's up to the
drivers to do that. See their documentation.

>is supposed to be obtained by end users and passed around. Having 
>binary data in there just makes everything more complex and error 
>prone. We want this to be as simple, easy and safe as possible.
>
>>
>>For dmesg, there's a reason to encode it as you pointed out... but
>>no users shouldn't actually see it - we should be getting all of those
>>cases in CI. For the escape scenarios, yeah... better having it
>>ascii85-encoded.
>>
>>What you are adding to devcoredump also doesn't even seem to be an
>>ascii85 representation, but a multiple lines that should be concatenated
>>to form the ascii85 representation. For dmesg it makes sense. Not for
>>devcoredump.  We should also probabaly need a length field (correctly
>>accounting for the additional characters for each line) so we don't
>>have an implicit dependency on what's the next field to know how much to
>>parse.
>The decoding is pretty trivial given that line feeds are not part of 
>the ASCII85 character set and so can just be dropped. Besides The 
>output is already not 'pure' ASCII85 because the ASCII85 data is 
>embedded within a devcoredump. There is all sorts of other text about, 
>including on the start of the line. There are multiple ASCII85 blobs 
>in there that need to be decoded separately. This is nothing new to my 
>patch set. All of that is already there. And as per comments on the 
>previous devcoredump patches from Matthew B, the object data can many 
>hundreds of MBs in size. Yet no-one batted an eyelid when that was 
>added. So why the sudden paranoia about adding a couple of MB of GuC 
>log in the same form?

I suppose you are talking about commit 4d5242a003bb ("drm/xe: Implement capture of
HWSP and HWCTX").  Probably because I haven't seen that commit doing an
ascii85 encoding before, otherwise I'd have similar review feedback.

Looking at this just now, so I will also have to balance the previous
users and existing userspace consuming it.

+José, would it be ok from the userspace POV to start adding the \n?
Then we can at least have all fields in our devcoredump to follow the
same format. Are these the decoder parts on the mesa side?

	src/intel/tools/aubinator_error_decode.c
	src/intel/tools/error2hangdump.c?

 From a quick look, read_xe_data_file() already continues the previous
topic when it reads a newline, but the parsers for HWCTX and HWSP
seems to expect to to have the entire topic in a single line. But I may
be missing something.

Lucas De Marchi

>
>And again, arbitrarily long lines (potentially many thousands of 
>characters wide) in a text file can cause problems. Having it line 
>wrapped gets rid of those potential problems and so is safer. Anything 
>that reduces the risk of an error report being broken is a good thing 
>IMHO. Robustness is worthwhile!
>
>John.
>
>>
>>Lucas De Marchi
>>
>>>
>>>John.
>>>
>
