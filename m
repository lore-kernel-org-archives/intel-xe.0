Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F2CC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 00:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68E810E6E9;
	Wed, 24 Apr 2024 00:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeyfrYIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144ED10E6E9
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 00:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713917754; x=1745453754;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p6rT3eRLHRmBdkGiydU1qCsWDr/06GJuoh+wyOplWTQ=;
 b=WeyfrYIya7VFT9WXmf2MMgIXtcrjRelnXxZu77yBwiB/I5Mif8Ji5uzk
 8BMP+/vFN7bxLPv6jjAW8DQYkRRFgn+SdWEU7s4KMz4KYS9FV4QkepmsA
 Pt5UjeSF/23zyh4ZrXflZRXteViGI+zD6N2p6Fv5PRqvzI2OHEpkXtYrf
 Zsc42kSwqNtF0KG/XCjq6S74CYEGZhzH4OUkNmhOQSuqrTc40ZbyuFV65
 0ksIUUGlYvl5OxH0V9cqCn3Cx7XwWrnEfGHfgKh7+RrXp48lvB0gy7tGw
 /L+570w/TJRUc5knnguw35fvlTYMaO15lQy2Zz9cAG7+/msK5OjS905wB A==;
X-CSE-ConnectionGUID: fcU85EHFSrCXQwGPcCmZUQ==
X-CSE-MsgGUID: aYusrQ0fQEiQ7ROqFEAr6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9380262"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9380262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 17:15:53 -0700
X-CSE-ConnectionGUID: kuehwT4pQviNErHzujn9BQ==
X-CSE-MsgGUID: 7BBQUn9OSMilaPMwJAf/0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="55500380"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 17:15:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 17:15:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 17:15:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 17:15:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 17:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PP1iglwTyKhT/NMQihD2pS9BFIYBCOnyO1zkVKcdB6Y8gvFPdRMSKNBZC9phXZbcCA758DG2NfLz0qYVm8D7EZBXweLPtgqhczT42nZbxbPa/ZLada2NOc6CSfWoG41T0a6cVckYJgJLdYEQ+I5BUcKD7Uv+MdcejrIx0lLIWj/7KlOZhwNOBgglDO68RpRZxRpVaIpF4s96k0ZKfHGBjEfhIOD4v+XMUahBfOteUBYaJjN9W79wT7C0S0/UcfGwr7R5Mqvxys4+lY1Sqxma36d9LK45iWCHOAVsmJUjUksNOYUmNsPbHrX0p13TG05VNZoSxuRRhmUIJvjmBYmKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB5lzDDXwebnqsPU4gktK3Qqqt9fWGvMuHAsZl5iRbo=;
 b=djgJ99IbISZKrxIBuVHuOuVGIU+Nxj+2haxBP/GHRNaCnBSBfSAnMBz1n9i4qMlbxyrIIMa2OR6vJyCKfQxdlzcNYpw4ycJOUepvyjao01jzDiVzdbSFZDEQkwO1JSKwc9HHVTwSJ5mcAob9kNf37b3gpcGIhxv/D4z6YnWxnRnkAjvojxu8ulwhvontq61Mfhz1YeTCoWXMXtkXwksrsJzW/JaIlFyFUfmWtv+Prh/tQh5fGhW5gD6H2BaRj6QCt5vAoFmH4S6b/Spz0vC244WodcZd9ibHsJaWeKt2Rzjx/rnP8Ni2aaSu132hzTv0vh1NhJWqCcFtuR82fikZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Wed, 24 Apr
 2024 00:15:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 00:15:50 +0000
Date: Tue, 23 Apr 2024 19:15:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <btomcunqeczg7nsssjnvr3d2lnuvmpy2ih5cvhloyximjbgpxe@mvedvkdlls7z>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
 <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
 <tjshefhgoeyfijf7k52fhag2xdfwsmysnn4sngh53ubittpljy@hhanuebvzide>
 <dd2760be-e098-4e83-bb12-e7c86e124a23@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd2760be-e098-4e83-bb12-e7c86e124a23@intel.com>
X-ClientProxiedBy: SJ0PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:a03:338::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: 367954df-d0d4-4c6f-d438-08dc63f3b1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VfWw73w3VlChO/11nAJKnCZqaDmyaLhL6swOFqdLb6fze11pPUv4iIS/+p?=
 =?iso-8859-1?Q?yJKDf7IPOBOKN2GPq9kzX3UEaRnV5L2mYD0L1cMWw4FjNwGdY2tkGxWbyB?=
 =?iso-8859-1?Q?ydJZmXjQG4EFdZiUPN9YmALP4Z8xyewUF51Wn14IH718fpVJZ1ZVxNqO7c?=
 =?iso-8859-1?Q?Lj866+2fyXRnfPK79mEyyo4ru/0wLMDgP466I9dr20lSQhfBhnD7jXnncG?=
 =?iso-8859-1?Q?XvlNmaMXSEL5y/+NhURMW/fBG7Uz4WEX2R9jbUXUFWmkjN/Zl6OlwIWLen?=
 =?iso-8859-1?Q?YQGEig0nAn2RPISeiMBr907ltbsMJR3ck/pWrwB7ZJx6mhCZbBulrkh0lS?=
 =?iso-8859-1?Q?WVv3ryg/Rn4R+VyNgbhlhBA1WxFLBmcKOZcEtEwxewunGbL+fbpOWoCwxc?=
 =?iso-8859-1?Q?YXLWraMKaIYLdpv2yYE3K0tBcmUXEfeTT28eyKGpzjzvyytoQiYqxd4saG?=
 =?iso-8859-1?Q?UiWCsTBkvdUL3EonDeL9yqg1aoZ4BxxChSF4Quci9C40YPwbQs0xsPXM/u?=
 =?iso-8859-1?Q?k/BZSR3T4n+tTVhG8s+su0gVwqd/hgBO0PcU9j5gMQgsIkRnwPeZdzTEve?=
 =?iso-8859-1?Q?i8nNHVkoVXXjo3hycLUZoJx8zxsA5G3pFs8yxSB5kELuSW0kylQmXo6KGK?=
 =?iso-8859-1?Q?V+fyDu9IkKTsVGf1xxwYeOzUrZjC7cZ3BRcQpR2d7P2V5CtMQgLOvsz46r?=
 =?iso-8859-1?Q?JUFQCKqUPKDDyiVC1Hl11V6CwARbPNIXIbmBD0Pfxb8J1yR+FpOVF8DMbV?=
 =?iso-8859-1?Q?Yu1LDwTfDTCiwi9C/9HPD7t4r/nsFhd/hPm436D4m0ShLVyrW3wvoHTwCA?=
 =?iso-8859-1?Q?5gXFapmYxK467Dj0rOcQd51JQS+pI8k0WU5/hrAdb4wKORr0iVRWl9nlpT?=
 =?iso-8859-1?Q?ZRo6C+ilqLZZ41pdWtNzAkAq6T7OHA7L1QuNK7ccjf4v98hP/yQQ4qD0vE?=
 =?iso-8859-1?Q?1hB1qv5UG6+j0GqbOhOl28ATI8h+hSTRbFTvbIxM7UAwrAG6Hlh+VwSJKC?=
 =?iso-8859-1?Q?1ZzFWsafm628o6D/36AZiu0fxiBuylLeDozpbRkP4Rh3gbAFon7sbZpJcP?=
 =?iso-8859-1?Q?aPsnaMn+4fqpcqEnUxo8zK+Q3XQ/PCa8WRgvoGOmykzlkkxETTVsiW0FSp?=
 =?iso-8859-1?Q?vqK3lXPqw+greVTujImJQgwzgPtJmjLFUXyYV0EtOkbGpUs+d4zgNqRHd5?=
 =?iso-8859-1?Q?qevPA+8gO5lpH4aqk2bJzAe5YDGgpJRTUN9KMwzPmOw1GHLHCXKLxwOAAH?=
 =?iso-8859-1?Q?YeG3QLVM0DErf9nMygADuRdRD5gULWi9y/m72+jhGrkya3XTncXYUtKVER?=
 =?iso-8859-1?Q?7AT/X9MfIjo7KJ3mcHI5ly61rA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3ZlzOBkZRqlRDRGddSfI7nSoJjQbS0cB/rtYpxC4u9CSyIAtXWTKnjE1b9?=
 =?iso-8859-1?Q?rhqNOIg/ZJOW5jiTqMmzFLRqph/qM661OBT4S2uAvzpbMTtUTVpajIViRn?=
 =?iso-8859-1?Q?csGQ+ngg4/qz+CbpROdEQYRPqIcFjlHcudLTV47dRgESwuNht2oUMxcVm4?=
 =?iso-8859-1?Q?OKSgXiPeyDqpwGgevoqBWBXnW8E+uFMts+tkWR68qF2bP74n5ebhz4a0JK?=
 =?iso-8859-1?Q?Y31ss/ekKSllVNskd3mQNKFWA6tidz8ZpHl4RNHMqd2q4/fE2W7NPnjLZ9?=
 =?iso-8859-1?Q?3ZK5neK0EoKdmvTaouFYEg4aWJFl9bryDAeb0wmxYOu1TxW9lw+YOUmuWa?=
 =?iso-8859-1?Q?x/k+5IS/i2zOzwe/AY32iYqR2IowYvcw6oqKwk6NwJlgMEjH7B04JhXvqJ?=
 =?iso-8859-1?Q?0rl4QZFEy7o6NqcZ/SOKayiUCcXBo3QllPuMcaVw9vkKkbnhQsiVjZ4Ae3?=
 =?iso-8859-1?Q?fTNgeHF1i6MADqPbjTEYFG7mwO+B+6go3iLBmrs7wDS0/U8WsiW6209c6y?=
 =?iso-8859-1?Q?Ew41KFze0TGJOVaUwHTJw5rQhj4VFfAHTkM7liTKebUCopb1JAH3TlLD2p?=
 =?iso-8859-1?Q?IZmRch6pHO/SWx9+0qfEyOXOU3rJJ8j7HgkfFs+oQFaCAG2IMG1cF1TKsj?=
 =?iso-8859-1?Q?FZeycwuoLdfNjptCCIuXLiZCp7oer371PftqGMaoox1WpFimX/zVBIeBAN?=
 =?iso-8859-1?Q?1g2KaT2JpqWjqJqguKpgkEQp7LVdQqLRJ4AN7c+m43KVMSh8c+oBlRgvN/?=
 =?iso-8859-1?Q?sOvE+JvxbZ51UpSHsLB1C9lXzSAN550rd8RWyIiVGalEa64ypUR4DeOJFJ?=
 =?iso-8859-1?Q?99z6+101DxiECNuGv2MgR7gEAEEX7UMHiiMpKM3UKNHJd10wU/b/URDSHP?=
 =?iso-8859-1?Q?m0D9nge5+bMqVkUju+zMiHrK/RVzn2a2BYY9MnnBnAnIjzJaUOVS9dxp9Q?=
 =?iso-8859-1?Q?b8ZitYARLEvaDTL7Ob6SwEN4ja6FAjeQrIBADgFqgtN/ih51IOvSDRu5Mm?=
 =?iso-8859-1?Q?Ea5raYQJhRozFdljsfG7ngMbArKooro4e041fl+oGmFGJaPKNofNJW4ANl?=
 =?iso-8859-1?Q?VZqZful1f4a6tiTeJEvsZ0ZwMrkssLKRIDfCX7WQAEHOW0mJjjWkUiGsIy?=
 =?iso-8859-1?Q?zGYTU8wvdHlS/edb21ANWs4XB2NbOAEIEdwk0XrHjIIv0OHLgusgZMllrR?=
 =?iso-8859-1?Q?wi84ZcpVSpvqsckzWx7zXwg2/R66L58VIRNbN79qxaOqp6b6gn1J0qLy1o?=
 =?iso-8859-1?Q?5Au4GCUSGBLlkBtcr5gLBjW/IxeovQaqKk7mQht7TIYJAcbHvY+vm1pQJS?=
 =?iso-8859-1?Q?kVmMXPM4OU/MmI7rL7zUqynJK/Wiyxc6pG/1JY0zEjIB2M87b+/BIzce7N?=
 =?iso-8859-1?Q?7XI+4wS1qBlf15FS1DdLGA+2k27MdyyjeAoZA9cPyXyQkrCMzueDCxDt+0?=
 =?iso-8859-1?Q?Cl4BnuVKzhrbC9WHMu3MDca280dLBQK51HZGSnGpIPa5CtDsRqiwfIalGe?=
 =?iso-8859-1?Q?8YosX+sESOTUJnPLuYN15OFxE7nyvjCc1B+ZKcmc4MAh4Q2oVTXH+fgeqa?=
 =?iso-8859-1?Q?GA7RWwAVtnDdZ7osItSgbAHr2ECur+EKSjOtzjeSMoS+FnUISgWtfnR162?=
 =?iso-8859-1?Q?T3fNn9epbEaKpZkGi2PGNKnhnm3EHfVasH6kaId/cy+X101PzmnIuEHg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 367954df-d0d4-4c6f-d438-08dc63f3b1f7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 00:15:49.7086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5YRoEylsSCTFcgiIoi/Pa0hosRDksSm8X/Tkv/gVZUz0LfQk9+zNhiXMb9q1HQkNf9Th3zsDYgB0lC0KPfRrTlHGWrVRebJo5i+NH7aC0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
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

On Tue, Apr 23, 2024 at 12:51:43PM GMT, Belgaumkar, Vinay wrote:
>
>On 4/23/2024 10:43 AM, Lucas De Marchi wrote:
>>On Mon, Apr 22, 2024 at 11:10:43AM GMT, Belgaumkar, Vinay wrote:
>>>
>>>On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
>>>>On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>>>>>This WA requires us to limit media GT frequency requests to a certain
>>>>>cap value during driver load as well as after driver unload. 
>>>>>Freq limits
>>>>>are restored after driver load completes, so perf will not be
>>>>>affected during normal operations.
>>>>>
>>>>>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>>>---
>>>>>drivers/gpu/drm/xe/xe_device.c |  6 +++++
>>>>>drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
>>>>>drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
>>>>>drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
>>>>>4 files changed, 55 insertions(+), 2 deletions(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>>>>b/drivers/gpu/drm/xe/xe_device.c
>>>>>index d85a2ba0a057..e29c152a6c4e 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>>>@@ -30,6 +30,7 @@
>>>>>#include "xe_gsc_proxy.h"
>>>>>#include "xe_gt.h"
>>>>>#include "xe_gt_mcr.h"
>>>>>+#include "xe_guc_pc.h"
>>>>>#include "xe_hwmon.h"
>>>>>#include "xe_irq.h"
>>>>>#include "xe_memirq.h"
>>>>>@@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
>>>>>{
>>>>>    const unsigned int flr_timeout = 3 * MICRO; /* specs 
>>>>>recommend a 3s wait */
>>>>>    struct xe_gt *gt = xe_root_mmio_gt(xe);
>>>>>+    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>>>    int ret;
>>>>>
>>>>>    if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>>>>>@@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
>>>>>        return;
>>>>>    }
>>>>>
>>>>>+    /* Set requested freq to mert_freq_cap before FLR */
>>>>>+    if (xe_guc_pc_needs_wa_22019338487(pc))
>>>>>+        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>>>>>pc->rpe_freq));
>>>>>+
>>>>>    drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>>>>
>>>>>    /*
>>>>>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>>>>index 60202b903687..556e73fca813 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_gsc.c
>>>>>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>>>>>@@ -19,6 +19,7 @@
>>>>>#include "xe_gt.h"
>>>>>#include "xe_gt_mcr.h"
>>>>>#include "xe_gt_printk.h"
>>>>>+#include "xe_guc_pc.h"
>>>>>#include "xe_huc.h"
>>>>>#include "xe_map.h"
>>>>>#include "xe_mmio.h"
>>>>>@@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
>>>>>    struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>>>>    struct xe_gt *gt = gsc_to_gt(gsc);
>>>>>    struct xe_device *xe = gt_to_xe(gt);
>>>>>+    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>>>    u32 actions;
>>>>>    int ret;
>>>>>
>>>>>@@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
>>>>>    if (actions & GSC_ACTION_SW_PROXY)
>>>>>        xe_gsc_proxy_request_handler(gsc);
>>>>>
>>>>>+    /* Revert the min/max freq limits as we're done with 
>>>>>GSC/driver load */
>>>>>+    if (xe_guc_pc_needs_wa_22019338487(pc)) {
>>>>>+        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>>>>>+        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>>>>>+    }
>>>>>+
>>>>>out:
>>>>>    xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>>>>    xe_pm_runtime_put(xe);
>>>>>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>>>>b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>>index 521ae24f2314..7f82b6c2ad3c 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>>>@@ -40,6 +40,8 @@
>>>>>#define GT_FREQUENCY_MULTIPLIER    50
>>>>>#define GT_FREQUENCY_SCALER    3
>>>>>
>>>>>+#define LNL_MERT_FREQ_CAP    800
>>>>>+
>>>>>/**
>>>>> * DOC: GuC Power Conservation (PC)
>>>>> *
>>>>>@@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct 
>>>>>xe_guc_pc *pc, bool enable)
>>>>>    xe_mmio_write32(gt, RP_CONTROL, state);
>>>>>}
>>>>>
>>>>>-static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>>>>+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>>>>{
>>>>>    struct xe_gt *gt = pc_to_gt(pc);
>>>>>    u32 rpnswreq;
>>>>>@@ -673,6 +675,25 @@ static void 
>>>>>pc_init_fused_rp_values(struct xe_guc_pc *pc)
>>>>>        tgl_init_fused_rp_values(pc);
>>>>>}
>>>>>
>>>>>+bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>>>>>+{
>>>>>+    struct xe_gt *gt = pc_to_gt(pc);
>>>>>+    struct xe_device *xe = gt_to_xe(gt);
>>>>>+
>>>>>+    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
>>>>
>>>>that's what xe_wa_oob.rules is for. Why are you adding it as a separate
>>>>function that won't allow debugfs/.../workarounds to match reality?
>>>
>>>The workarounds are not initialized at this point, this is early 
>>>in the driver load process.
>>
>>ugh... the _early() variant was supposed to be the sw part with
>>minimal hw. Now we added a few super_early(),
>>no_I_mean_earlier_than_super_early() variants... but with other names.
>>
>>How do we call xe_force_wake_init_gt() and xe_pcode_init() passing the
>>gt without the gt even be initialized? Are we trying to create a house
>>of cards? This init order is in an awful state :(. We should stop
>>pretending we are getting the engine info from hwconfig and just fix the
>>ordering so we can call xe_gt_init_early() and it really happens before
>>things like loading guc.
>
>Yup, doesn't look like an easy fix here. the GMDID is populated 
>somewhere in xe_gt_init() which comes way after the early_init(). 
>Cannot check for WAs unless we have that.

nah... if we were reading GMDID in xe_gt_init() then basically we'd have
not a single WA applied. xe_gt_init() only stashes the raw gmdid in the
gt for later use. But the place that we really read it is
xe_info_init(), which happens much earlier.

The current problem is:  the xe_wa_*_process() are called in
xe_gt_init_early(), which used to be very early. But now we have other
things happening before that like xe_gt_init_hwconfig(),
xe_pcode_init(), xe_force_wake_init_gt(). None of these should really be
happening before xe_gt_init_early(). While you figure out the second
part of the WA, let me take a look if there's a not-so-ugly fix.

Lucas De Marchi
