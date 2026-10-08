Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D86CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 09:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F38D10FD52;
	Thu,  8 Oct 2026 09:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLYrKTms";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3729710FD52;
 Thu,  8 Oct 2026 09:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791452920; x=1822988920;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=dEPWGzqRQl09Gmpwr9HIDgDViPV1r4VQoskZbWYYIYE=;
 b=YLYrKTmsolaqjFbpKsgcW7POBQLeD9DdQaWp8KQ405qmt9M7T2WF7/tB
 d6xD7ch7nHRi16ytekkM5rruDcs2Isypb3mzltau83WlH9HNo7t0t5uZh
 2CsJg1HdDNo3jCq/6icupdZVeCAi4KP28SBUy6nqolCxPoghmE3krlamP
 Htnsk/dwqPLqqdq8XFNfyPzFddAu3pKnWENPG6hFpBSObYwKn5l91RYB3
 9pVg2GgixM8DhRl3zrMMMhoZqPpJMXeuHSGtDp4nx6pymLI5026v9U9Bd
 whv4UqpxaeTDzk4A7l/mjrVluMF0wfEbafShoSbzlrdfUa9UY+stBFRp5 w==;
X-CSE-ConnectionGUID: fcd7cyhyQnejlXsZYEwtYA==
X-CSE-MsgGUID: dbfxgTR8SUmLv0TYOTiEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="109179"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="109179"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:48:40 -0700
X-CSE-ConnectionGUID: 1ztsTPMFSf+JsTnPgNriNA==
X-CSE-MsgGUID: 5sEPmOqGT3+flkIN2bzRtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="441087"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:48:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:48:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 02:48:39 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:48:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t20JYG2MG1BIZUpEtWud1g398YzxUZ/z+K6ORhNaEeh0/L0tWFkiMwrSlgGmAssB2r80sHQXiMNQlurp9uWQHofl1xwkJtdcOTMp7PLei3zniiB9XrXCiTXfAyR4jvf7ikdY9OaJIXF9IYkGKg47PsbkOPljLj8sWJEJy//bYCCrGDrNXAuB/xVWaR0C7liXr6VThWVcVHKGh99AWF6rluupgu7wpVxcmyIS9pHqDzdLFrhRpxUro1ddwRywmmkA4nprGf8L3clPJhpDOKKoFcodg0mCiKS8oBNXvpG2oy310RaxuwTKu4GsqptEdibTrXze0tS6fuKwCa3LrOn3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEPWGzqRQl09Gmpwr9HIDgDViPV1r4VQoskZbWYYIYE=;
 b=BdgnSspD1h13LKmaMfN01SzgPePLlcmLazujqilRlBbZ31yOiIgU1kUm6TQcYVYxr6O6Bho3y6DttBsvFzbFnrorVO5yFOouFtIjYFlz1lJDWqok+Y1spkE7f/nL9mZ+R6fNiE8AX65SCmyp/rSLaEfrJLpmV14H5xwCWVKNTmko6ndPsEYnb9zIkBaL3T9Noa0mRDSOUCQpLF/13NI5DI5dvvVrvRnw0Dm+rfuAOU6BhFO+5R7Quh/+B58C8FsSp7O4xDH15OS2+CS41TzqcMye1F8DOamdd7ba6UWCEcN0WB2KywTepl3ILr6QSrZKkiaeMditUBzhxFR2HjPvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:48:37 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:48:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 8 Oct 2026 11:48:33 +0200
Message-ID: <DLZD22VNHIGD.1INFC09FTA93N@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/i915/gmbus: Remove the
 INTEL_DISPLAY_WA_16025573575 leftovers
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.22.0
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
 <20261007222314.5714-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20261007222314.5714-6-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: VIVP296CA0033.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:356::14) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d12efc-a1d1-42e3-95d1-08df252152f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|4143699003|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JJHWr4kLyyAyU6N391JZhIh/2C7Z1roYqLlN6DAKjuBVHAwMHFNUlF6CZrDXH6JYcD1K6vjDlhYs96VkWWTuoEU2plvoc3DXUEi3iExzB2fle9Oyc6Jon0HqQf6bwezgXHm7LfY8otlSM3UdQ5nZFHvee7/bHbo3d/Y6wifPoSbx3GhWUnmuHkDnqc9W8/eSMRsBiOrEfe1d2WDlWKq4goJ1fTLpCr2f4jJU+3+IWtJwhHY4Hb8JnHhPJZYfz2UWeAc8Nasb3tINvqtdLZKz0PmrmryjKmsAFtIS/1BRYr2LyojZeHPDybFzK4OkmHGKbHq9aBXoq3NidXIeg6RLeylTYludfLgvZnpfP/iBxHAFFqtEjMnWG9XkIGpSApFuyWJ6WklMZyK9JPsKuCuS5/4AlVHBPIH3eQWgPx/PEsP2Nemr5hCRvSZM5158zHFeMgSwAKtuu3hL9Df5fiPeUHrsAu60G4J7SoSG/zwRhmqw7pboujspiXdFcGB1Y0GpBB156izRak53f2Djp0fyscj8pVS9Puvr3hJZnuB5zDzcIQuXD/h5WZnV0hPMEkDtWhYluJ/lyIyUO1vkaXzd4wAPvt1B5kpUlag7F3y5GpcdOy61xHv7WKF4OkgnYMr4zOEoPMNpewWw6uLMcJozCqfzuMCPuWZZ/jwVZzyd9Sg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1R0YU9QNWxSZVVMRjNhQkNHVDlvTFg5alZhUDV6S2FualdKSjZ6c2x6TEQ3?=
 =?utf-8?B?RDRuRlJjUDlPMjhPcWtidmw4a1FpazA1cGZZOVRVRzJUOUNMZlNjWWpKZWNp?=
 =?utf-8?B?dmx2d0pHVERTRnJES3AvM2tYcU1WYTdOck1hVEgrS0FZeldrN2IwUWRPUitx?=
 =?utf-8?B?Vkx5STh2cGhqcm1LdGI5bzVEVU5JT2c2a0JXM1ZrTWs1bG9nSkhJRXV3QzI3?=
 =?utf-8?B?VkcreDloY1hKVDNFbGF5MDVSRFZQd3RRcDVEbjZGZWdJOFFZUlhhNDFOdDQw?=
 =?utf-8?B?aDcrZWhjSkpmeWZNd2crUjQ4Qlk1R3J1YUdDelRJa1YrWnd5ZHFqVlpJSkU2?=
 =?utf-8?B?ZXFHRFEzZEZPTm0rZ1FYNllmZXk1aUdUcFArUlJBU2FaWmxTSmU3cTh0VXhU?=
 =?utf-8?B?dHA5VjU3UW1UbVRrQ0N2M1hMU0dSYmZlQnptYWJPZkx5elh6NWtoU0ZHYUpt?=
 =?utf-8?B?a0xoNWRqV3dubDNwS1ErL1N2TlZxZ3Q0Szl3b2oxdGJLS1IrTm85RUFHZ3U2?=
 =?utf-8?B?cTNNeEFFRWFOTDVJSGFGaU5IY2lUbEdzNWNPV2hrc2hMSDFOdWF0Z0MreUVE?=
 =?utf-8?B?QWYwQ2VzVUtKd0wyWGF1NXBmRFg4K1BHOGU5bTFOZ0pNVTNjaDloeTFuMkZQ?=
 =?utf-8?B?bTR1dzQxWG5pTU5mSG1TWGdxTEJoTXpUVUhZSEx4ejdPaTF4dE5FTFFTanVH?=
 =?utf-8?B?bGxIYllnRVpoRjBBOXZ5ZTBRY3UxeTVZZ3Z4REswek5Nd2ZUUlBzdGh0Z2tW?=
 =?utf-8?B?WWNuZ21wSUpUY2Q4NGhybjlCSnVINDVGYnFpVUthNFd4eGplaDQ4VExBQmNH?=
 =?utf-8?B?ZCt0bThJQUJzTllnNG9UendJaE5VSUJuRWRNQ1BGMlhrU0paZnRMejAvL3JD?=
 =?utf-8?B?dDFnK01TS2dJdEE5K2xzN2EyR0Z3L2hld3lxNVdmYWh3NEpBRWJlaXV2aUJ5?=
 =?utf-8?B?QkFBajlQV2lNMG1BNlZWVUdoN0k4ZXhxMWlEbG1rSDk3TFloaWdHQWZLNzhj?=
 =?utf-8?B?RjMxUnFrRzZ3YVppVDZhd2pHbjNabTd6NTdJYUJ2cnRtNnVaVzZWQXVkZnFz?=
 =?utf-8?B?S1FoTUcrTHhSandaeGxHdnZWTTlROUM5R3NUdmtyTjZzekZJZDZBQitlM1ZE?=
 =?utf-8?B?RkVmS0JGMGpzSWN4UWdCZ0Z2cGtSdjNhQXQxVktReVZEcHJxcXd0UjY5eUFJ?=
 =?utf-8?B?MERlcGFNcFdoZFoxSDJLT2VrbkFVSktuTHgzZ3VZdVJrckhXelNCVitpL0l6?=
 =?utf-8?B?dGZLVWppSE80OThlZURXajlhcldaRFpDVnV6UVFzMEhBTzNhWjh5M0FwenRz?=
 =?utf-8?B?TmVENUZwQk1KaHI3WjNZS3M5M0JCSC9jd0RLeFQxdFN2aVVQSnN3VGpPeklH?=
 =?utf-8?B?NG5kL0hjVGlqSy9Vdy9XbzZQSkR4Q2FlLzdPZmJnOXcrZENWSWloTFpmczJT?=
 =?utf-8?B?V09GOWZ0VUsybG12TFpDOTFTZEpwVk5jTW90bHllRTNUZ2VTLzFpK3pCQUVu?=
 =?utf-8?B?NHVibG1mbWowNTNuN3UzVVhJOGhiM0hUVjgrUSsyQmw4NWMwbitoa2YzTHVn?=
 =?utf-8?B?QjU1QllKY0psa0w1dzJzMzhyYlNuN01XdzcvUkNQNjlHdk1YbDNOaE1LT0tC?=
 =?utf-8?B?c3FqT293akZMem5WVGtYNU5BOEZlTFNPcklBMGJ6SjNUSmtJTlZnaUpIZVMw?=
 =?utf-8?B?elEvYTV4d3daWlZzMnJQSHpCZWlpaW9haXBLNysrdFUrcnNPK0pPRDVnSzI5?=
 =?utf-8?B?b0FUZjlhSDlPVkJpR3pCaU9EQS9JbDUvcHdBeXBEZ1BpenJScEJqeXVWdWdp?=
 =?utf-8?B?MXhYcFFkdk9ORmdFS2k1MDQvMXNjdHlLYis2YW8rM0p1aExMcjd5em1ScHht?=
 =?utf-8?B?RjBYQllrSS8xYzQ1RUQ0TDh6bHRGelJJVndhVnJnUW1lK2p0d2NxRUlOcFQ0?=
 =?utf-8?B?SXZyeUU1MDdRVTlaMWFpWHhzNTJZbnY3elFJVmcxUGI0UWZQajcvV0NCWDhy?=
 =?utf-8?B?eTZwQXpiU2ZjR1F6UUVTK2cyNUJWMlNoQzdiRGZCMWVxSFJsUDdFS0ViaEZO?=
 =?utf-8?B?SzR5SEZ0RWxHdjJwWjhZVDBIaUx5NlNtb1pjRitRQmxpQ1FrMlI5ZDhNNXVh?=
 =?utf-8?B?ZTB3R085VWlzRDNjZUEvUStKb2tEMlZRZ0xDYWhrZEpoT1JqcXlRYlZMOEc2?=
 =?utf-8?B?U3RsVVdpSVVIaGRNOFJCL25ESllSV3NES3dsc3EvK2VCek4rNlB6MDJVK3Ja?=
 =?utf-8?B?NFBPQ1FFbDFtQmlUQ0FWaUlJSUVSbXcvZHZqT3BldjBuK1F4VXV5NUp5djRn?=
 =?utf-8?B?UC9qS3RZYmNjTXV5ZUtDeGprcHRiVTczWXYvNkJsT1VrR2tvWGpoVDBHdk5L?=
 =?utf-8?Q?/cipG3eQGCoHFVH0=3D?=
X-Exchange-RoutingPolicyChecked: Bhnj4vz3GDP9OkHiDTHYESpflzZm4ZJ96ZKKGzj9yZWphTeocdMSwky4CeTjA3Ym8EuPyVDkD4g9ZbUZ06qHOCbpRXznUL3I1oNWlefM29so91muR3VQGpsiAA/vfPx4ZDUTPzHVrRSDbkr5kuCPgBhUvYNKvfz579/0aQqBx57GvtKW4QhHiVDHCuazy/PrWFmf6cnkBVEy8paYV+zJP+4CA1O9T3wXVUNYbd8Cq609EViRmzx8nJgmzkfLHucZui2jyKdByC4jP7ZT2E6iS3scpebdOHYNWICDK+UfDX9rGNc1Oje2Gb2YVjzrWSuDMIRLULZUoBKHw8g54aCvWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d12efc-a1d1-42e3-95d1-08df252152f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:48:36.7256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJjfAgvKVpfXVUtPlMVWFd5YeYL//zGiLccHuNiSn8tNdvg84Ll1HzWtvRe3ZJcKSoDw44fFMLkSsYxEe/yxrcbuRzarpIWUbsFNaVM2PEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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

Hi,
On Thu Oct 8, 2026 at 12:23 AM CEST, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> We no longer need the INTEL_DISPLAY_WA_16025573575 since the
> bit banging code now always follows the w/a sequence.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

