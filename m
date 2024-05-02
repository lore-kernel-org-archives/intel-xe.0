Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF68C4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 17:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195ED10E0AD;
	Thu,  2 May 2024 17:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+cbrVdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A9F10E0AD
 for <intel-xe@lists.freedesktop.org>; Thu,  2 May 2024 17:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714670866; x=1746206866;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U+BL9ssbk91n7lHI0I7ZIlS96HmT1j8A0nOaN0nxiOw=;
 b=M+cbrVdEqFxuTj54qUAcq/LRBylZrTiNpp9bnJ/+HzatxKpHUO/FA94R
 IKrljY3NDslu3ynlZZHCWWstms8gY/Hr5DqGU96573ELZOPbeNIrI2FnX
 lozMqLJr9Xje7dVLvZtfRb+5cNpXkhow0Z7c7KC06A4Y/+kj6R+y3mh9l
 eBi7onmbbeqGVorSehnq0IYO9WuDgDPygc12WV0H2kGnBDBfmpTk6Hr7f
 TVQxeHoVvnrBLbDRxhgIrngdAo2YCDNfEOEV8ovQpunBdZlqQIqLc45zd
 mS8xME6JhPLrR72l4YhY4NV5wZvAO9A8nYYjH9KGvENVeWmBfv8x8Nmzv A==;
X-CSE-ConnectionGUID: 1+Wt6+ILSJa/BwLStvupqA==
X-CSE-MsgGUID: JLaW9gKUT6SFIcOU3NfiTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="14260975"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="14260975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 10:27:45 -0700
X-CSE-ConnectionGUID: /QTkHlhqSeyphVibF15IwQ==
X-CSE-MsgGUID: CIgB8foRQnGAorMNYUiSqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="27293519"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 10:27:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 10:27:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 10:27:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 10:27:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZioS88wB6kVwzX+GKvJFaPEb9K7O+DZukK6pidaNq//HTSN8U7D+RKwE7RgCEIune0+sakmcQeqCvFYoytnC1+WRGE6D23tlQBPn+9UGop2o6iDpGQmD1RVHidRL6jAM+nivdnVyhSRUtKCLDCJcT9n/j+fMMr5PWrz/EQ4/ymLosrhO1V9TkLAB3rmYJY4xSTkciU4ybpFEcxHgbyd60Ti/LiNfC4hrcVPpic3gHiodsmg41iDMw/U7cITy9xT3tZ5F46z5/X6RyMtRckNXSfxwcTqC8fO+2KSVkArsdjihPkTShughmqmxkphc5RKM0Q+j74FUPAtajP+nmUtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhsY4DPAQXu8Z1dtBR6zcYp5c/H6NjGPt2+ejr2Ej0I=;
 b=fSdkdsmK96YM0U2w4tb3m8+1ljmXFHGSIJXE1kf7/4vT/uJXVDLgQZvVTKjy6rsgvTdq1zfkcGijIoU0wqNK4nOE0TCN5Loqtv3nY3EOx3NMHFf0xi730P2rduXbKOQU/HZwPcDq9rvmg2FbgJMM7Y864iTLlBIi/MnaMB2mj1CI3/h0J5qc34QEoRjXSe33QtcdX4bWOWoYyyl5Zjn8jOsS7mV7v2cVJ5H6t4dlmvNFOuvU0eQSEWpPJLCaA7TYcAAx6y0KRlxgB/3HnC+t3au7TpcTpwaiduLDnMTweL39+bSlBvYI1sDnTO1vLHqsuRggVntX93E0E3G1k/lWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.24; Thu, 2 May
 2024 17:26:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 17:26:59 +0000
Date: Thu, 2 May 2024 12:26:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>, <michal.winiarski@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Drop __engine_mask
Message-ID: <u3yk3pbtysegqltmlbhufuqhv27zqxefef2jkcm4klgy4dkkiu@nmt3dij4d4bj>
References: <20240425182410.2705061-1-lucas.demarchi@intel.com>
 <20240425182410.2705061-2-lucas.demarchi@intel.com>
 <ZjADLvXstooUQk58@intel.com>
 <ZjAEtBb/P1kDQzeI@DUT025-TGLU.fm.intel.com>
 <2nxudidnseyqjxa7fsug2nnrudaysoqysl5vp2ftr4ikt6u4cw@ufsbnqheyovt>
 <ZjEUm9LD8irh+eKh@DUT025-TGLU.fm.intel.com>
 <87b968f4-e6ec-41e2-af11-03b6adc6f0f8@intel.com>
 <qer2v7bslci6af6u3ygkcpicxyacbex6r54wzfyww32rq3sevu@2tovdhmfdp4t>
 <7db2a29a-9a5e-48e8-8b28-711a74daa815@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7db2a29a-9a5e-48e8-8b28-711a74daa815@intel.com>
X-ClientProxiedBy: MW4P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: 90712e23-e0f3-47ef-2c93-08dc6acd12b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PYT5Q/NravS2PyZQkY1+FuHo1j4BVs83ek/Yp6MkuR1PK7BpYvWDf2Z6FJ?=
 =?iso-8859-1?Q?jZ+tFJtu1vyHMcnoBtQggI5ySzZoI5SV4oeV0aRYnNvtQesmIUs2OvP7E0?=
 =?iso-8859-1?Q?no4lsbZEW8YqOqHe2eboyv6E02FaTUMrqekwTWsTyyFUbkK5ji5JKRb9Uf?=
 =?iso-8859-1?Q?6822BPsliRsl7QjQqEygc75faQE5oTYxft5kpZXtBzgtdWOLZOT/rtsW4m?=
 =?iso-8859-1?Q?phYN9kX777IlwiSRFWxtckrrY5zZ7lW8NiK+6G0GZoN9QoIxip1rpYIP9n?=
 =?iso-8859-1?Q?OLkWxMkYQYsierVzZBOFVb1hsGlR08U4GMe7g2khaUunEAv09SXfkGCZmn?=
 =?iso-8859-1?Q?Pps0GiRFGkl8FriL7uV4OidxKo0oNB7ywjvTud4jar64DX8F8vKYlrXyLy?=
 =?iso-8859-1?Q?r/1/6UDCjU4anylyoGT+A8+4UH5nfyWM0RMxUsg8BUjji4Kq5q8nlwwDGp?=
 =?iso-8859-1?Q?w1kasfRGay4zx0hemstICtuli4sMIALlXQMBY7vqRiGgo2EFcmzToUM3sQ?=
 =?iso-8859-1?Q?kRF6bOxNYfh3yi9hxZWaKEbk0kGKFhhP1Gq0MVgKqCyq7HB8N2/QDluHto?=
 =?iso-8859-1?Q?9v4y1wHfSvmgJldnHSo8pfBt+mOHbtbwH9sOzL+7vvW/LDj8jLrCoUDD+j?=
 =?iso-8859-1?Q?yPBYFpcBTXiAnOMhPN9hqX7eCljOrNounpHEMU7IZme7aHHbRON4Fs6lWc?=
 =?iso-8859-1?Q?IYLmwrQmw5rIr+m7s5sNQ9lfbs8S8c4BNg1ra4azTWctpNom/huXAxw8yt?=
 =?iso-8859-1?Q?bUCKGyouQuopJWMiBVYUGd465zNr5Fc4Z2x/sNeDiGhbu9lKjFF0xOMsGC?=
 =?iso-8859-1?Q?xyAY7+a+QPZIclEJjrpNHjiVJDfkk5X3SQvNXf/9Q96n0DZZFAluMkIhHD?=
 =?iso-8859-1?Q?UEr2LHZ18G9e3Y7GWayXRn2daIleBjnt9bNTpJ06SyU1BQp3vC30R4/QCm?=
 =?iso-8859-1?Q?wzqMp8rtF0lv/JMF8/kKNEtTk7K10hbTkLR+aW5NF0LGXw/EuzV6VpWb6T?=
 =?iso-8859-1?Q?UkUq8kY3Q1H3f23+F4myTX6kBl+liVWjVE1tw35tRszNyn3nYrmaElLPHy?=
 =?iso-8859-1?Q?HxYf8VJUaFuUpr1ZxI10GtGNET4FW3MF0Hib4kfnPIy2seB1vVH5CxGxjf?=
 =?iso-8859-1?Q?7GVDOyG1DPVNg05Hb2LxnBMeQRXiMzPkZzboyRFyr7yhXSTQS60eXLqMbp?=
 =?iso-8859-1?Q?VM3/pOMWdHI8OqD1iU6l+/ql10U0+BJvIZCvC1i1Og8VFcj/C+KSjmGil/?=
 =?iso-8859-1?Q?17XswyQjfNU5KL+fL3luFFPhnKx1PnngCFXwg5iUz75HeRcMo77ebzvqRl?=
 =?iso-8859-1?Q?sRmHRjqOxN9n5wTrIz97X6Aa9Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eZ6aQs/P/cnFvgkDAjwIuapwcU2su+jF7FI3AHnndWHumw+TEKw+cuHUG5?=
 =?iso-8859-1?Q?Yh5gnhuicw22EDTabnFaTVQOF+7Pct3ftWVmRDE4beZrJY+On+oZ6dNtbZ?=
 =?iso-8859-1?Q?9+8LTHv21lRv8rwhfbUw+BbzkVsRrE6XEY2vchA2NMAw3Zqz/Xj1mCupxb?=
 =?iso-8859-1?Q?MoiazX3wlFMM5Gy4w27gmfCbwDRvtOdu/X+d6urMjvjBfGGVvPDg+autPW?=
 =?iso-8859-1?Q?/HAbo9XxQ6J60X+aKVfvgM3B9F8Vo8nlYVQpmndUxauytIEFUGxcOaSt6X?=
 =?iso-8859-1?Q?lV5PxQfVLtX8Rs018XhbSg8cXvow3Cmf2su4en0UdhjO/3BlFuDee9UHzv?=
 =?iso-8859-1?Q?dA0CMsJuMhDihB44TDsvLZ/IqM20fJ4IG2wTWzLHhs9qlf25bsR2pzZI7m?=
 =?iso-8859-1?Q?Do+QGLOd+Tfim7nUqq0zojVcgKB1jCHVL00a0VzRd5UmK3H008ePk5I2LR?=
 =?iso-8859-1?Q?M4GmYka8XxS3A4s90dCGAezaQwcn3gxAjGby2MAo97+6V02pN1bVAGbbYc?=
 =?iso-8859-1?Q?yVb59R4z/8D/AtTL58+d+2ISX5R7/fJpwKFkeR2+nEEYDq5EimIdcSPwtA?=
 =?iso-8859-1?Q?gbrxOK4GZciz6v1fvrGC0NyI4Rp0GWdXcYfeoyrDpgrmxvLjo7OJ0CtQTN?=
 =?iso-8859-1?Q?zMywVt9Dze3FZj29yYYpmHjt7sFcAHOjF5pOQ4evrFYozkQiGvw3KzNAo/?=
 =?iso-8859-1?Q?wATfpooKSAQABsiDF/HapZJyBxvSpCDuhx4wJmH7J905dUnViosHoW6pOd?=
 =?iso-8859-1?Q?koSQmWY8pF3UvdFcWiey+li4JspC6hlrXJbF4bz1vrjCzY92yLVnx5Zggo?=
 =?iso-8859-1?Q?cTwP3znD/H2Z3BOV+bCdJ17GOno0S+uOLK0hu/rHAhxaBDgAJKkRlwNTLC?=
 =?iso-8859-1?Q?oolaFSO4aGn4qX9A9M4tJsFZVP/FVdIC7aZQY3v8Cjtr3dKPWMQyKVCJps?=
 =?iso-8859-1?Q?FkBJUbg7vvL8MRj/4bA6dV1h6GxST2OJdKaCqtXly0hlvqKD3JksBeBzMN?=
 =?iso-8859-1?Q?S3aNNKRBOSdmdtc3dJocwMS9VY3jvaJnnI5rZljNAUJkJ3O02ifiSjcp8m?=
 =?iso-8859-1?Q?q78DKfcPUdEfPRH9UNyWvjaghcFDhKZwlLgkuyHdDQRdItIAEvF7EGactu?=
 =?iso-8859-1?Q?l3pFLqEJu1cm+skq0jMn5kKqXGX3U7/kdBvJYT8Q/WvvqbSuah9PW4/TT7?=
 =?iso-8859-1?Q?MSdn4ta4/yBJ5mSzk+2FuOI5X0b6tWfSXSnOCiKMQoJ21PIvNGV7cepC0d?=
 =?iso-8859-1?Q?k6O4/OxYTsvr+ftT1WoKwlwjE3pTV3Eg2dcB4SRKRWAxER8+QJR4WvNr31?=
 =?iso-8859-1?Q?fs0thyJiphrPUl4RGJi1FHdFN1h3MFztmrzd1C8SKZGW2VmK4Xz58vGsEt?=
 =?iso-8859-1?Q?bucxWKAxH+XeicniNZOHvGNhVFvkFrB2Tkd+zA24W0h2Fz5E9lyba2FF+J?=
 =?iso-8859-1?Q?y+Xcrp85WGVzwRh6YfSUEqMR9mjUfYfUxxQ0zDvUIHRQUPRpObUjcDzoz0?=
 =?iso-8859-1?Q?WR91QjNpSBz4xomty3m3pVJ9m1Nl8FXm/CmXTJ6Oi/H8RUWYn/ZD7sA3bE?=
 =?iso-8859-1?Q?7OE2kG8EMueTMDVDuLy9SP8uoYjfAQabaCGoNSsAuC05dHk/hydnpy7Y4W?=
 =?iso-8859-1?Q?FTJQXhZzS3Ro0N//ws96PVsG4DqMvtcQiWnIWc1kKP3RYGJEmLHsshmA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90712e23-e0f3-47ef-2c93-08dc6acd12b2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 17:26:59.7741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIxZkBGi4si3sw5cfUxEXo1aL5Vv2YyMsvYo46SBGhHhaGQWhIPTeyfjh0eYJmCXeTk3Zto/A6EYxZQ8tswIMW7ZnJaJqprJ86K+Eo60dZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
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

On Thu, May 02, 2024 at 04:12:43PM GMT, Michal Wajdeczko wrote:
>
>
>On 02.05.2024 14:55, Lucas De Marchi wrote:
>> On Thu, May 02, 2024 at 01:54:55PM GMT, Michal Wajdeczko wrote:
>>>
>>>
>>> On 30.04.2024 17:56, Matthew Brost wrote:
>>>> On Mon, Apr 29, 2024 at 04:03:25PM -0500, Lucas De Marchi wrote:
>>>>> On Mon, Apr 29, 2024 at 08:36:04PM GMT, Matthew Brost wrote:
>>>>>> On Mon, Apr 29, 2024 at 04:29:34PM -0400, Rodrigo Vivi wrote:
>>>>>>> On Thu, Apr 25, 2024 at 11:24:06AM -0700, Lucas De Marchi wrote:
>>>>>>>> Not really used, it's just a copy of engine_mask, which already
>>>>>>>> reads
>>>>>>>> the fuses to mark engines as available/not-available.
>>>>>>>
>>>>>>> I got confused trying to understand why this ever existed.
>>>>>>> It indeed doesn't make much sense on today's code.
>>>>>>>
>>>>>>
>>>>>> That was my doing with the intent that we never use the engine mask
>>>>>> until after hwconfig load as the engine mask would be read from
>>>>>> that. Or
>>>>>> alternatively in SRIOV via CTB (or MMIO) relays.
>>>>>>
>>>>>> i.e. it was fake way to enforce correct load ordering.
>>>>>
>>>>> but we never used it from hwconfig (instead we kept the fake copy here)
>>>>> and we never will as it doesn't have the info we need.
>>>>>
>>>>> Instead we just went out of our way and started using __engine_mask
>>>>> instead where needed. See e.g.  drivers/gpu/drm/xe/xe_migrate.c. I
>>>>> fail to
>>>>> see how exactly this enforces the correct load ordering. At most it
>>>>> would return the wrong value and we would silently ignore it (e.g.
>>>>> if we
>>>>> had a call like xe_hw_engine_mask_per_class() before that point
>>>>> since it
>>>>> uses gt->info.engine_mask).
>>>>>
>>>>> For SR-IOV, nothing overrides engine_mask anywhere. Not even if I look
>>>>> at the wip branch for VF.  So, I'd say that if VF needs it, then please
>>>>> add the prep together with patches making use of that because the
>>>>> way it
>>>>> is is now it's too fragile.
>>>
>>> but the idea was that for any engine overrides there should be no VF
>>> specific code, except the way how VF will know the fuse values
>>>
>>> in other words, the only SR-IOV requirement for the load ordering was to
>>> make sure that we can use GuC CTB, to allow the VF communicate with GuC,
>>> prior to making any manipulation around engines.
>>>
>>> separate requirement to use hwconfig by the native driver, was actually
>>> from the arch team, and it was a prerequisite for SR-IOV requirement, as
>>> fulfilling this requirement was guaranteeing that MMIO, GGTT and IRQ
>>> would be operational, thus GuC CTB will work.
>>>
>>> note that actual driver implementation, before this series, still didn't
>>> comply with initial requirements, as while we pretend that we can enable
>>> CTB in xe_guc_min_load_for_hwconfig(), any CTB communication will fail
>>> as IRQ are not enabled yet
>>>
>>>>>
>>>>
>>>> They should read the fuses via a GuC relay.
>>>>
>>>>>>
>>>>>> Assuming fuses are read after this removed LoC, the load ordering is
>>>>>> correct.
>>>>>
>>>>> fuses are read much much earlier than that, in xe_pci.c. Why would
>>>>> it be
>>>>> wrong?
>>>
>>> only GMDID is read there and VF must use GuC MMIO (lucky not CTB)
>>> communication to get that.
>>
>> right, I looked in the wrong place. GMDID is read from xe_pci.c.
>> Fuses follow this call chain:
>>
>> xe_device_probe() -> xe_gt_init() -> all_fw_domain_init() ->
>> xe_hw_engines_init_early()
>>
>>>
>>> on VFs we read fuses right after we get a hwconfig and enable
>>> (malfunctioning) CTB
>>
>> where? except from  the place I'm removing and the place we read the
>> fuses, I didn't find anywhere the engine_mask being changed.
>
>to be more specific: on VF we are getting fuse values at hwconfig phase,
>just to have them cached locally, before driver will try to 'read' them
>in the call chain listed above.
>
>  xe_device_probe
>    xe_gt_init_hwconfig
>      xe_uc_init_hwconfig
>        vf_guc_min_load_for_hwconfig

are you sure you pushed it somewhere? I found this function in one of
the WIP branches, but no sign of using fuses.

More specifically, I'm grepping for user of engine_mask and what is
possibly setting it. If in VF we read media/graphics/copy fuses to tell
what are the engines available, we should really be setting engine_mask.
Somewhere.  How is VF being tested on systems that have engines fused
off?

Also, I don't thikn here we are talking about partitioning (different
engines to VFs), are we?

>
>and that's before
>
>  xe_device_probe
>    xe_gt_init
>
>and while it's after
>
>  xe_device_probe
>    xe_gt_init_early
>
>it doesn't change too much right now as on VF we don't call any of:
>
>  xe_wa_process_gt
>  xe_wa_process_oob
>  xe_tuning_process_gt
>
>as those access registers that are not available for the VFs
>
>so we should be fine unless some WA/tuning should be handled by the VF

then those should probably be in another category to be processed by the
rtp infra.


Anyway, I'm reading this as "for sr-iov it doesn't matter right now or
in the mid-term future", so I will proceed and prepare a v2 after
checking why CI failed.


thanks
Lucas De Marchi


>
>Michal
>
>>
>> thanks
>> Lucas De Marchi
>>
>>>
>>>>>
>>>>
>>>> I was thinking the fuse read required hwconfig step (also brings up
>>>
>>> that was due to the ordering suggested by arch:
>>>
>>> 1. read hwconfig
>>> 2. read fuses
>>>
>>> and since 1) requires the GuC, so MMIO and GGTT must be functional
>>>
>>> thus for 2) the VFs can use CTB Relay (as MMIO/GGTT and IRQ shall be
>>> already functional due to 1)
>>>
>>>> CTBs) but now that I think about this, I believe the fuses can be read
>>>> via a MMIO relay so the current location probably works. Double check
>>>
>>> according to arch team, we can't use the GuC MMIO Relay anymore
>>>
>>>> with Michal Winarski on that.
>>>>
>>>> Anyways don't let anything I say hold this up.
>>>
>>> btw, I was able to test this series on my WIP SR-IOV branch and didn't
>>> notice any regressions yet
>>>
>>> Michal
>>>
>>>>
>>>> Matt
>>>>
>>>>> Lucas De Marchi
>>>>>
>>>>>>
>>>>>> Matt
>>>>>>
>>>>>>>>
>>>>>>>> While at it, use XE_HW_ENGINE_BCS_MASK to span all copy engines.
>>>>>>>>
>>>>>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>
>>>>>>>
>>>>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>
>>>>>>>
>>>>>>>> ---
>>>>>>>>  drivers/gpu/drm/xe/xe_gt.c       | 3 ---
>>>>>>>>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ------
>>>>>>>>  drivers/gpu/drm/xe/xe_migrate.c  | 3 +--
>>>>>>>>  drivers/gpu/drm/xe/xe_pci.c      | 6 +++---
>>>>>>>>  4 files changed, 4 insertions(+), 14 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>>>>> index e922e77f5010..00a22cf2f5b5 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>>>>> @@ -515,9 +515,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>>>>>>>      if (err)
>>>>>>>>          goto out_fw;
>>>>>>>>
>>>>>>>> -    /* XXX: Fake that we pull the engine mask from hwconfig blob */
>>>>>>>> -    gt->info.engine_mask = gt->info.__engine_mask;
>>>>>>>> -
>>>>>>>>  out_fw:
>>>>>>>>      xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>>>>>  out:
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>>> index cfdc761ff7f4..72568414fb7d 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>>>>> @@ -116,12 +116,6 @@ struct xe_gt {
>>>>>>>>          u32 reference_clock;
>>>>>>>>          /** @info.engine_mask: mask of engines present on GT */
>>>>>>>>          u64 engine_mask;
>>>>>>>> -        /**
>>>>>>>> -         * @info.__engine_mask: mask of engines present on GT
>>>>>>>> read from
>>>>>>>> -         * xe_pci.c, used to fake reading the engine_mask from the
>>>>>>>> -         * hwconfig blob.
>>>>>>>> -         */
>>>>>>>> -        u64 __engine_mask;
>>>>>>>>          /** @info.gmdid: raw GMD_ID value from hardware */
>>>>>>>>          u32 gmdid;
>>>>>>>>      } info;
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>> index 9f6e9b7f11c8..59a3f24d31e6 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>>> @@ -936,8 +936,7 @@ static bool has_service_copy_support(struct
>>>>>>>> xe_gt *gt)
>>>>>>>>       * all of the actual service copy engines (BCS1-BCS8) have
>>>>>>>> been fused
>>>>>>>>       * off.
>>>>>>>>       */
>>>>>>>> -    return gt->info.__engine_mask & GENMASK(XE_HW_ENGINE_BCS8,
>>>>>>>> -                        XE_HW_ENGINE_BCS1);
>>>>>>>> +    return gt->info.engine_mask & XE_HW_ENGINE_BCS_MASK;
>>>>>>>>  }
>>>>>>>>
>>>>>>>>  static u32 emit_clear_cmd_len(struct xe_gt *gt)
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>> index a0cf5dd803c2..6b2086ea24ab 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>>>> @@ -656,9 +656,9 @@ static int xe_info_init(struct xe_device *xe,
>>>>>>>>          gt = tile->primary_gt;
>>>>>>>>          gt->info.id = xe->info.gt_count++;
>>>>>>>>          gt->info.type = XE_GT_TYPE_MAIN;
>>>>>>>> -        gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>>>>>>>> +        gt->info.engine_mask = graphics_desc->hw_engine_mask;
>>>>>>>>          if (MEDIA_VER(xe) < 13 && media_desc)
>>>>>>>> -            gt->info.__engine_mask |= media_desc->hw_engine_mask;
>>>>>>>> +            gt->info.engine_mask |= media_desc->hw_engine_mask;
>>>>>>>>
>>>>>>>>          if (MEDIA_VER(xe) < 13 || !media_desc)
>>>>>>>>              continue;
>>>>>>>> @@ -673,7 +673,7 @@ static int xe_info_init(struct xe_device *xe,
>>>>>>>>
>>>>>>>>          gt = tile->media_gt;
>>>>>>>>          gt->info.type = XE_GT_TYPE_MEDIA;
>>>>>>>> -        gt->info.__engine_mask = media_desc->hw_engine_mask;
>>>>>>>> +        gt->info.engine_mask = media_desc->hw_engine_mask;
>>>>>>>>          gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
>>>>>>>>          gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
>>>>>>>>
>>>>>>>> --
>>>>>>>> 2.43.0
>>>>>>>>
