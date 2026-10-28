Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D3606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d1sFM4jH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DFE10F9CA;
	Wed, 28 Oct 2026 06:17:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2774810F9CA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 06:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793168223; x=1824704223;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ribmuk64TTD0oh4raNEVjDmvGBhf/KQbGyItbJAmwkA=;
 b=d1sFM4jHHirou5ozZd6pvVzlKVv9QsDkFFvwgtLlTrXBdxOLrmS0GoBG
 hA82mwq4rITwirJjVsDmkM4GNbtkwZADipqhUiQWmqCYwnRIf4ZS4hRgX
 Ek0VOwKDCKRVWw5MYKANlPHt86HYnZwB6Yf2l7ppNlK1VnM/+mQuwc8qN
 wSDbM/Mjo91DjvfWxKvvGg1D96sdH2Nigj1GVE0GVlz1y2OoGIYs6t0S1
 9TBX7ipRunHN+WVpCsm86pu0yvs1KYnHNYiGwYSic3W5n8Ek/w3J+OBU/
 8UTflteEQfvMg/REqkgn92CCEpW0nCv+NdtqPsmvISZlULYj/dlALfNsb A==;
X-CSE-ConnectionGUID: WMBMf+BCS2GWwVjs41TD7A==
X-CSE-MsgGUID: F1QF15iFQ4KfA5E5HcUSBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1986167"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1986167"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:17:02 -0700
X-CSE-ConnectionGUID: PUwaTfzaQsChR5sCGuuQew==
X-CSE-MsgGUID: An1OP+zZTJqUld1ef7WiHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4654660"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:17:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 27 Oct 2026 23:17:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 23:17:01 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 23:16:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8fw1A/gv+a3pjY67wd/hRWQceFWUByQW+XY6AGSfAtsUGEPC1HhvGfV5WgZpwjVXK8snW05eLOh7WdmQ/YOcuWExCmt+PIElv/r7Qq2RoQV0sp0BDfP02jQd9HXmsKsyGrg9q+igfZhaCXTisiEWrh6r/2O+Ih8XRCFJmlM2qZeFv+Hkoaa/YDogxGykTsMHco7LvM2Rd/767sz/nfbQgmfL1D+xxe7eYnUOVMJPXDlaQOqLJwKn72Pai3cx5l9pywKgCS/vkFkd95zdj8fxaqDTyvt3seVrFxr6leB+HVLi+vZiiMRBiCmrV1sdo4MfQwU4pFL6tj1VcchviDMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOKaDgoaepBPMPrGWzamUmf2/B3P3p1hYvDN6Yafo0g=;
 b=O6hBgucuyDGlQkMhdqBf8Ss6q2N1OU6RxBuR03jRHtG80Am+d/Jd7IpJ83Nb6P2N7He7v9EPZ58gOuKH9hN8KWafqGMnfD43Am2Hc6XftjoewyBhGeOLzv/FYc+t6P7nR+X+iD5xkHuJrDJvN3t3/dCzjPRFY8UP/dq6nLX5IueIcD/udou43RPiFViEjvgzr6sy7K9B1xOR4D/B+PpzERpGww97aISwXBWspyaZJKirLUOhvMRjfSARULIkYTArktGu/fngwQMlrpnivGceRfK1RbCwFy8mAwaTd9J4FhdOIx0i5WiKrT1Z/dnd5SAtxkpCmRxhO8XwKsjSdgzx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 06:16:52 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 06:16:52 +0000
Message-ID: <7eed64cc-70fb-4acc-8577-b92764e7f4e3@intel.com>
Date: Wed, 28 Oct 2026 11:46:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/xe: Add wa_14028434957 to Graphics Version
 35.11
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>, Varun Gupta <varun.gupta@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-14-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-14-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0265.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::10) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|MN6PR11MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e3dbd0-86d8-4573-66ec-08df34bb0e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|4143699003|56012099006|261021121427099003|260925022911599003|261009223027099003|260925021911599003|260925021311599003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ktjwGz0+Lbmq3hdRxwrhUw595ODtstPPZHscR/Xq2Orcb0yKEV3vQW5d8+81Nao0DfP8PQ7AVfDZhgJvnv0MhXwGYSVlO4EkzjmcN8Re5OqXX4+k4tbm6OplLLToIe/YT7NjMTH+pw0mKaOVu3hcvY2gvilrL+lydlU6ftXxZh6VTv8D2zq5ptIfPO5X4MNRvTFekGyOoShyYcIvkBQnF5yL5vSpytNr04TpY8oarf7mUGB40MSbh+q7Lvq6sx/eTMHR2BxH+MEBSLzt0VkxNQuGoRy+wCA6I+gTGxSricGtxf0tuGAJnTM7EstSkZs0OXwm0cqpvjPGm8BnPr5gthmSRRwq9L2Q5oOGjAEtpGVQSwbw2yoCFgpjWiJgdZDo5w1kNord2b13LQLny9BG+ybK9YTDhrQdbGbs945pE18Hif2i7TNnjuvJHbxfL4gGLIZoIKozzbWyOIFTPMtjZR5OHYLmo74r5sRXaLI8/6DGUqeg8D+a25oOn4JuOV6b85sk6DkvIhyRB8mqLkPhmfEvPav1kVyW64mOYEMcMeJzu0+Jp+v5YjkMlaAZ2rP+1CZF2Hk6a1fzHOgtLt0bnhOqRLG/r8nmLt2Vzfrg10DmOwtfARCYs7sNhnYGh4yekuOt6XwDwHLf9Sc+LxwuxFuBtdyUb5+TUfnn+CoebQc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(261021121427099003)(260925022911599003)(261009223027099003)(260925021911599003)(260925021311599003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODlsYldNWm1Cc0dzUEdPOHovKzkzYk8ybnk4TWQ4QjA1dFNCZHg4QVRvQ3VB?=
 =?utf-8?B?SE9TbVhrbThmYmQ0NkJLSmRSa0NuSEJIWGsrSHRoYTc4Wnk1b0x6cDFoclNP?=
 =?utf-8?B?bm1ZdzRSelFJVER2MWF2QVBrbGJ3VWZ6dlRDV3dieCtpZ1pTOVdiaTNvTVdp?=
 =?utf-8?B?RGs4eWowanE0VldOZklIMS9Jb2RuTHpscDFQdWE4bU80WC9tWk9YSllodlVr?=
 =?utf-8?B?b0xuN01udVhvbGsvNkFpcFJrbXFpeGRlUmdBQXFuLyt4bmFtc2t4NnZjM0M2?=
 =?utf-8?B?SmtMaXRXQnVjS0IwQ1M3QkJBK09IQ1FPODlML3pHOVVRbFlMNzc1YjgxNnZm?=
 =?utf-8?B?U3NDRUpwNWcvalJmQnlUZUxESDFqOU5YK2RET2RpZUg3aExLbmJtNk85ZFUw?=
 =?utf-8?B?K0tZMGNlQUJ2Zm9aTEViN1dBb3l5Vm01bUNSbmhGMkpqZHBZVVVkY3oxOXE0?=
 =?utf-8?B?WGVhSmJVK1dHZnU0MWFRQk9NaTZpSkVXdlBqcE91YWVjMFNiSkQ2MGY4eWtF?=
 =?utf-8?B?bzVDMTh4Wm41TkNNVlUralNHTHlzQmJvbFFocXlJUnJCYXY2ZDAvdlo2dDVo?=
 =?utf-8?B?VitUMXFZaWdhNUl2ays5VWFPVS96SkpnU0pIZktmazRkYTdoQUhrRnNJSFY4?=
 =?utf-8?B?OHRKempPZnErR2F3Qlk4ek5YVWh3S1kySHJXaTZEWHpLLyttQmxNc0JCeGp6?=
 =?utf-8?B?SzJkNWxaTmdMWFNhU2E4ckFSTnBRNEkvTFZRT3orNHRoUktuUlZJcmt5S04x?=
 =?utf-8?B?aDc1TlFRMzZDYnBUSTBmdzFLalpHa2JmQ1hHYVVEeTJQNUFaQVJ6aUVkaWNv?=
 =?utf-8?B?KzduN3NBZFg0blBUM1pDWTVLeEdRZ05sTWVYNkVidXFIeVRlKzl0dks0Qmpm?=
 =?utf-8?B?Q2I0cFc2WmRKNHJkL0l2QWk5Q0hWMFZqUVlWeXdZZXdlK2FlTXRUb3hmSElt?=
 =?utf-8?B?TVBibjJMWXFTRHJ1d1I0MnJYb29UZFhtaFlxdk02RHBtS25MWkdaaGpBS3RS?=
 =?utf-8?B?ek8xMGU1TFZPT1NXRXVCWTJyWTRBUjBnVFpyNVNqakFzaDhmR1BOMTZqaVp0?=
 =?utf-8?B?WWpWdCs1T0tHaFRGTVFEZXFmdHpFMkZKTG5xWFVzTExIMzFyZGttcitXWDJj?=
 =?utf-8?B?bFBXWUtCNDlUNy85WFdTTjhEc3pMSndOL0ZHZ2R0ajlkdmFWdVBYOTY3dE5y?=
 =?utf-8?B?NmdURWZvWExmMHZhTGVLK2k0MFNmNy9XRnl5OEpGd3E3SGYzaTRpS2dpZWdn?=
 =?utf-8?B?eEs4NTh6S2JUVGtqb1hTTkk4eS9PZ21rTEhPQW5jRFIvK0lEMVRFSnpXTnkv?=
 =?utf-8?B?N0RVVUx4NGh1QUJ2QldNZmNiVzJXUnAzNlFQZXgvL2d5TzR5emgxTDBLYUJT?=
 =?utf-8?B?Wk1TRmV2Q1IwdjNqa01MUi95aXZIYkd5aFdSOGRnMndnQjg5eU9Ld3cybGZw?=
 =?utf-8?B?Ymc3dTNNUFhXMmw1WENOWDFjSzNkZnAwY29DUUR0WmQ4d1liUk0yZGpGUzNM?=
 =?utf-8?B?dGE2eGNIUHdEeDBGVHVuYTdCWUYzTjEvaGo2N1NHSDQzRGwwZkl0b3NQLzgy?=
 =?utf-8?B?cU1pTUxMZDVXbXFVZGlGbzFsQjM1MVRRMFMrSytBdDM4T21aamFPaDYxQzN6?=
 =?utf-8?B?NC9SdDZqSXN3UXY2RWJwK29VL0NNUmkrUnNyeE4venlQdmNiVTBiOUwyUnBO?=
 =?utf-8?B?R0UxTVFRa3p6ZkpMQ1pqY1o2QlpXZVFJRktDdnkwN0ZMU3dNTW4wTDkvV215?=
 =?utf-8?B?WEpoY3ArUjM4UnhqU0xKbFVpdTdHZjM4dGFieG01bmxXdTFsbVBJUjFVZWxX?=
 =?utf-8?B?dHFHcnVhK01naW1FR2I4ZVlnb1pvblVkclZjMW5IVklyODRCNURPeHFHbkNN?=
 =?utf-8?B?NjJtWUNsN3prOVQ0S2g2c0JvZWFrNGxqRGhLcGRDRFlqcGRKTTRqT0NDbkRL?=
 =?utf-8?B?UFFHQ0Z5M1huS1p5SGhBdWFCOTVXM3ZRYzF0YndlU3FBOUx4ajdKbnJzQXhl?=
 =?utf-8?B?M1ZmeGJJb1lwQS82MjlieWtOM3FoWmtpUFhSWEEwZllwUFNvSFJRMzJUYi81?=
 =?utf-8?B?djJwZmJ0RlpMT3BvaTZycVk4bnJYRUNITlZna3ZLTVhOeFJoMnF6V08yRmlK?=
 =?utf-8?B?NWZPV0xZVkcwbjVRRXdPU3kyRW5VWVlLbW9Bb2pTWHpZVFpTNTJIL0ZtcndU?=
 =?utf-8?B?cCtuMWhtMnFSNHlteERJV0ZVNURNZU9rNXI3STRxaE9aTDJvMDVhcEJyUHdH?=
 =?utf-8?B?U1NxVEVSZHY1VUkydUxMUEluY3BNempDSmNLMTN1L01qWGdsQTJKOGdjekdQ?=
 =?utf-8?B?S0lUODVRSis2d3o0d2dRYlNMQmp0M2hwYkNoQ3hRMGtMaEVjR3JmYW8wT3Fn?=
 =?utf-8?Q?i4/R+jGIFcx938oE=3D?=
X-Exchange-RoutingPolicyChecked: enEl9cIuC9xMS9GAhHNlt5VZNzLolJKoK8MZj26mDBAU7eNM5nGtxQYPq/lgUDO9TyCH7b8nGhubxwJ8DlMuOBHB5y0YHfdSB2+3b7EcWqVBhr+KmJJqtT81BHs2LNBba7dxc0+KDVpapDC2aJm+h6tL4kbehT82ithEMNnUvvvSVMGFCOTKX9ws6U1Eu+sSvk8V7UoPvDtDm0qyMIvVwchkTAxwsXiDzVQwSHwTKe2thE86GFIBgfwGwifNz2bTTl0dWFtaN242VG15KN7/SZQ3Ix+KMi8v4LzZTsjVj5jP0+ocsuhOLbsSm0HpvXjN14U9HdXiyFwjew93RZ6pZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e3dbd0-86d8-4573-66ec-08df34bb0e4d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 06:16:51.7438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvICLN4igp6TdpvKVDmGRzlKd0v985BsLa2iBebzrrbayUco5ZaSJYqIJBEr9f10SluDJ9QbeFYIOwrGYuyF7JcWm1MbYyMbuaHzMChnPXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 11:35 am, Riana Tauro wrote:
> From: Varun Gupta <varun.gupta@intel.com>
>
> Add wa_14028434957 for Graphics Version 35.11 to the table.
>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index d8dc41851425..36b2567994db 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -7,3 +7,4 @@
>   14026633728	PLATFORM(CRESCENTISLAND)
>   14026746987	PLATFORM(CRESCENTISLAND)
>   14026779378	PLATFORM(CRESCENTISLAND)
> +14028434957	PLATFORM(CRESCENTISLAND)

can you please combine 3 and 4 patches?

Thanks,

-/Mallesh

