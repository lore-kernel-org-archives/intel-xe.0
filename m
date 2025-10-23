Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3646CCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 10:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B568A10E0CA;
	Thu, 23 Oct 2025 10:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KlqrxujA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B6C10E0CA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 10:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761217082; x=1792753082;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i9oBnAd9temZztx6m6miKo/WnyfYQiGk1NkiP++lbmE=;
 b=KlqrxujA7mT3f5zTAzYM+WRyJ9xtp1zaRL1R+HqDGFrSYgqS6JjpLprT
 N0Z0EbWvZ9EFapY5Ua9cr2Z594jCEBcXKShRjWDDzFaeJQPWQBHsp5UiZ
 cW2fhN3N/ZZ1465mq+2QAvOb3u5o8xkrdm4WMdAGQIQBS/2Y9KQsiLYTa
 2U0N3l4eSbPHEHLR6pcZjLa/TKV/8ZlvKWoL8q8FOlgtmythwBzu0l9Kf
 P90mWed9RIafz8EciJdZKBNzQoVF3eD/+jxjEMmobNJb8LyBx+aOlDhLk
 A+D7ZRRXk+s8FG04nAyehTSvla3kdrJsDXJwt/wctcoUY93SMqyt7q04C w==;
X-CSE-ConnectionGUID: HOH3V3Q9TDOzLKIsXd76DA==
X-CSE-MsgGUID: i8j1wsEiRwOzc2K03TWiug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63419652"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63419652"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:58:02 -0700
X-CSE-ConnectionGUID: bhucZ16YT1OIgkaVTwvbDg==
X-CSE-MsgGUID: Kml0H8EkSRCPQU6TWXJhEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184195393"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 03:58:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:58:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 03:58:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:58:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKZshMqeP8WK6jiQThuNyqqPLDsECHMBJXjAzgC2XbGeKKPBaYyZ/IaJcnyz89ovAm17AUdeh2WD2B7YCoGqJqvVnIzvwInuLb0czVz6PtB+O1NS62qN3OEvgSNIKuwoBFCYWMctOH8HtU25YRKA0rCl9yMWvIJmy/tUYah9wujmYAlFWmPrHR35wsj3iZZ3C2ewv2bRtSEvYZ8yrENp5ssIQGjIdg/k8Zs5J0GBBPmSPHpZg1aMMllkL8nwkKgR+3Y5W9CbwO8WGHb7tUB6tPH/3CTQCzWnQ43U0YX3kmYKLOaPKf/sCs7oI5pMMpyVCgPVFCd306S91a5wv9r0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEuVw3DJTPDP3crnOezjTaAX2M/H4ScuU7U2QpYCC9Y=;
 b=rJsnSbgAjADO12RnZhJsLHvtpMmgv2jr630tWI0RcSXTDWMEzGpb0UT/bNE+NoVvAmmkRpaC4rPwWxoy6G3gxYVEJIqen5ad0lpjb9jg1yebaM96KEvzmLyz53UCMY4x8spYlWucH9MGPs+hHYVMPlp3UBO4w5oL7ATOLLXYKz7PiuRoZJwnBTJND6q+5mVAC27iniSIpfpdjDBRjjJm2USKDhoZNTjsoqcVbJ+qOcB21LbTu/VGFbvF/VT+i+cYEgdOY9bovFBt3Nr5rAnuSKclEYPvDnK4dzRIEZEZgiiKzel7lTU4sYHO9gK4T6qbtFTCe1xKT2BItykV/31zcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 10:57:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 10:57:54 +0000
Date: Thu, 23 Oct 2025 05:57:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 01/12] drm/xe/cri: Add CRI platform definition
Message-ID: <iaspa7qpd7yv3wlsr5j6afu6hyi43uurtz4iydkxgmfpcmurus@yanpiuisnnjo>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-1-bf11e61d9f49@intel.com>
 <aa7fa70a-b54d-4bc0-8c2a-01d300fa4b1d@intel.com>
 <imrwxmkq74tgmyngenrwxl3rv3r23t7dqu2b7jsemlb6jdc4i7@l7cf36qdwfgj>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <imrwxmkq74tgmyngenrwxl3rv3r23t7dqu2b7jsemlb6jdc4i7@l7cf36qdwfgj>
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 5721ddcc-d1f0-459e-692b-08de1223046b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?e+Syef2tCIQeqODyOZKKhzPxyp0VPAjZkVk177OayunxFpbq99lYHP9CQO?=
 =?iso-8859-1?Q?1W1CYSMcxDkKKHJT0pQ8KiWzZp/LDSLUbk/UGdPRNCt8qxTJLbJs0pVraV?=
 =?iso-8859-1?Q?iExU3TxokEcwDz/0eXap9VNyzdEbM9w8u3hI9FuLAFP4gnCEPDngGlVNpz?=
 =?iso-8859-1?Q?hSfQnHiolK1VHUY1r9m3UzAham7k8DjT/qyvCi4+Sm9qp5VCr1E3KPl7Pz?=
 =?iso-8859-1?Q?IJh6X3jmf9ZT6zE1C8EA55Km+6lb0SzdbVT2wgNYq0BrJBcxTCfF1H89g0?=
 =?iso-8859-1?Q?GF5DQlzjQzLB9sYe6G9bZNKUlyN5fUswJibT0L8oeA9vM9mKf4LF7/u3Lj?=
 =?iso-8859-1?Q?h8/a/pGhWDYApmutGiFMLUBQTmy0qk53VZBGaPL265OqyD7n8vB4HRMmnW?=
 =?iso-8859-1?Q?51S0kuedc8OEzFQVoTCB1hb8ZVDiW3hA1I5QuGBCSFapoz2NxI1CZP57aS?=
 =?iso-8859-1?Q?e304HJ+Rt3MnL50PBzS96mEtyXKtBQuGAxAt7NtSfh3qnUbqNoRkLsQMBA?=
 =?iso-8859-1?Q?c+cKQ5AmyTns9J1biWKc8to9iWAD62sH1EDHMx3PaToIR9s7PH+OywFvCg?=
 =?iso-8859-1?Q?G0NljhcACanDkiYq+iyDNqv2DEjKHzmwFK82+w5oG0acEMFD25aYaU+Man?=
 =?iso-8859-1?Q?POjkYdlFprZZoBUTZp1U4+jpsFtHMow5vrKOMuoy9ZgwKua2EHjiAXw9IW?=
 =?iso-8859-1?Q?mb3h6moO59V5O8ET3nCZgGHJ7thtet/W/44TCWxKkzJYGuJLUgNbr5qBmC?=
 =?iso-8859-1?Q?KiHWjwF6ngIfbC6u/7z5EXstsEz5qaAPKRYeC+/TBNP4LugC5qzcDPPZxJ?=
 =?iso-8859-1?Q?hm6ANcOzgteg6J/2sHij/+rPsL7giTR9DjDfcarzmduaEDh1E4Ng/XXqK+?=
 =?iso-8859-1?Q?UvgSXgQRH9bMt3Cy1rCvRdjRYDAgxpcknNGh+ZC/vOMRLcnhUzwe9Jin03?=
 =?iso-8859-1?Q?28SNOPPqI/gneaJN0uzVzbTZmSrXFI1u8Eg3RfXYcdFLLzS+pJ+pQc8qMz?=
 =?iso-8859-1?Q?XTffTm8oM2IY/t+kej+jIYZ4iW4NJ8JKuCdD/7mmPD4D1XhfgAlBkIIWDw?=
 =?iso-8859-1?Q?lwsdeJnKITgjWvLkvw3I7IJmeaACRJH96Iwaqj6GfotVCQA27I/nVcJFpy?=
 =?iso-8859-1?Q?mneBOarVFLY89cGNbCgowPnwUN1iQg4YWrhu96nqNQh81oLs7zuyuuXLBD?=
 =?iso-8859-1?Q?Y6NyE7hYi+qHapNW8RWSBzb4nVhSWhwdwVtv9ydLw1rjqALf0Ht9reZcjx?=
 =?iso-8859-1?Q?gzRG+Op+Bc1PAN1qHODrvSWOO+aamwCIYoxrKel9TRBwWIUImNNEmicRsw?=
 =?iso-8859-1?Q?sWOjcw0G8CnCucaAuRt689rG8QM752cbBsPTyOdGAWXejmekFkd6g2QtQ2?=
 =?iso-8859-1?Q?CKCyfOypDgq+pa+0macn6J6M9mIXNje/Xv3yW9mczGpDY6J4KV5M8uLLGd?=
 =?iso-8859-1?Q?TrSIkGo2pT2s0f1krKkLH8+QM5N2CZbBgTSulgWIiMKVG4EXqI0qp4NRMo?=
 =?iso-8859-1?Q?iGf6R7QKC9KSPVQ6suxSW0f89zF/PFvmiLtIHXVr7wT+qK2fwfvSGvLQ21?=
 =?iso-8859-1?Q?3wGV0By3yTWSVP3i7C33QFUlXTjJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5DrGYCPyICCzOuR2ZwmMOdHv1kMbOZMBS3PWuouV+Cuf1fijVu9b1JD449?=
 =?iso-8859-1?Q?gP0lEgSPTSGWXIMaGkEHIhNkE7IQ6MYcHovMXgGou3p3wP2PIHNdCAeTCO?=
 =?iso-8859-1?Q?vjfEKXu9aLLNB9BBIMr6ajWW8SwE0fwZ/0BI9L0bHKTLZRnaQecgl7FsGq?=
 =?iso-8859-1?Q?URAG8r3CgCaZjy4dmdFMGvN6k62tnRj1Kp8Gl0UnaMkslimEYk+q3Zrk1C?=
 =?iso-8859-1?Q?x9t7Cy1qqDea3DW3p/1jqJP5bslmTR/5NqYiLc4/mvgaNA7dixoeS42d4B?=
 =?iso-8859-1?Q?1yPm6L44Hg8U1IiqSTImFujZVmV3ym3dsxl1gRlEyfDYYDZkJZVcSYRhpA?=
 =?iso-8859-1?Q?FU7DyucsuWivoxyb0g++LQ3Jz1d72NXo5Gh+d/xIQHmU1HeVCV7Wbsec0D?=
 =?iso-8859-1?Q?Ea1DDa5b0X/eptuDACYk95annz7FFMxc/BWRKYKbP59lCndprEzQcmn0Y/?=
 =?iso-8859-1?Q?SGLKff9vfedXLRmA1gZu4DRNhFNRjBij2HUDcnHQQo03xOxvPq41TWI3eH?=
 =?iso-8859-1?Q?bp/yFrm3wRwukRv+HsLEWKcTMqoK1arHPkVnk8vHPO217mdDRarPoDptr4?=
 =?iso-8859-1?Q?RinYLi986/MklY5ZPfAXg4y9W633dpPFeJaGbtsNUC0VY8tPi749w3eYz5?=
 =?iso-8859-1?Q?d0ScE/maNau3EV6AoxTdUpTDjUk4BfJz8oKm54FSObid+6akBEk4v8DmuX?=
 =?iso-8859-1?Q?eOBxP3q8d8GJ+RyWMWQVUtyBH+8VHXUt0PqXvZj8n5uQblJIuDDYJtTzoL?=
 =?iso-8859-1?Q?jlCP0IDHnJxC/0uYh92h+9mlkWzofovQ3kVveNzOyXbiRyJA1Sr7JQz/6w?=
 =?iso-8859-1?Q?laEQ7r0jw8/gCeZUR1OxAN3xPw3l7IIjDKvNdAtlxMCVjNvTNf6DAr4vhX?=
 =?iso-8859-1?Q?h0wSVC3kyedqCqaHfGofSK3OhQMJ6RnSXr//H+II0BPVmXnqdHdMxeU5+N?=
 =?iso-8859-1?Q?acQJyStTvUfclDhW1IZ9wcrn394oHy4TUxb6lRPMm6xm7cnnNoHOen6l9f?=
 =?iso-8859-1?Q?sJ284gDFdR72U1gIZRanQb+rD8RumngI7RTFaSOPOiim++v3hMoFXqfRWi?=
 =?iso-8859-1?Q?WhCJzkqjDSw9kY2Q9/DsgOMLxk4qX5SGwtyh0L66d8wQDDSUz0TGRVID/n?=
 =?iso-8859-1?Q?36A2rFfupK5vxJiBctfsx1buIwYWXcOEYEsQ6EXTu6ZWKX9Y6E74X6sgCN?=
 =?iso-8859-1?Q?gPyY4kUsbbneZVfU1GwiT7TUvkVmoSB+1JmglG+soYQu1O/5zHo3G7AEpb?=
 =?iso-8859-1?Q?B6AjLGtz/o18wZASJjHzkokzizjDbRnnRDtj6kxApzftVOiCLb1SNw13kd?=
 =?iso-8859-1?Q?HtF24GVnz4eO2Z9BRRAGpz0NvaWk5x02D1qzrIb2WupVQfTcOwt1Nk+tpB?=
 =?iso-8859-1?Q?FNM3h5aw1Uc2iRO3qPfHgHHl3qchBB6JNHR+DKthpIsDkRdbLKGxogPFeZ?=
 =?iso-8859-1?Q?Pd9N8O+reBDBFC+sFLWHbz5YhGLp1YKTB5DIobuCajPN2dcmcWurl/VAqw?=
 =?iso-8859-1?Q?ZMnHDMMMzArrBZlgG72EyS+Anl3br5y7BDr2qJxhPCH8UtMLr4pc9Ui6Xs?=
 =?iso-8859-1?Q?n64RMVB9icqb7112KMy6HSILfULf3EDHezAE05ncU4VI12VIp9meNX7e5I?=
 =?iso-8859-1?Q?RpyIlLz5D6EIgXO7qdlWv02TIZ2ZPGf/IZDjzYj9v2MT7EZWuaxmnF+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5721ddcc-d1f0-459e-692b-08de1223046b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 10:57:54.1935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCelOG6+Uoe8KAfVU81jy/hTVZo8w552I3w7LdQuMy5SzujvxOCJfE1iTFq9bRcRsDTLT3DAnUjcj0EA2A2JlHukprMHEEGmMaXFWAZ9dJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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

On Wed, Oct 22, 2025 at 02:45:33PM -0500, Lucas De Marchi wrote:
>On Wed, Oct 22, 2025 at 08:28:32PM +0530, Shekhar Chauhan wrote:
>>
>>On 10/22/2025 10:47, Lucas De Marchi wrote:
>>>From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>>
>>>Add platform definition and PCI IDs for Crescent Island.
>>>
>>>Other platforms use INTEL_VGA_DEVICE since they have a
>>>PCI_BASE_CLASS_DISPLAY class.  This is not the case for CRI, so just
>>>match on devid, which should be sufficient.
>>>
>>>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Nitpick: Maybe include the Bspec(s) associated with it;
>
>Bspec: 77971
>
>
>will add that in the next version.

thinking about it again... to make it easier to handle the other parts
in different series by different people, I'm going ahead and merging
this.

Merged to drm-xe-next, thanks!

[04/23] drm/xe/xe3p_lpm: Add special check in Media GT for Main GAMCTRL
         commit: e681ddca301931dbea99fcb4bc5a5dacdb7fad06


thanks
Lucas De Marchi

>
>>
>>but other than that, LGTM,
>>
>>Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>
>thanks
>Lucas De Marchi
